import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

void main() async {
  // 获取可用摄像头列表，cameras为全局变量
  final cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CameraExampleHome(title: 'Texture的使用'),
    );
  }
}

//Texture可以理解为GPU内保存将要绘制的图像数据的一个对象，
//Flutter engine会将Texture的数据在内存中直接进行映射（而无需在原生和Flutter之间再进行数据传递），
//Flutter会给每一个Texture分配一个id，同时Flutter中提供了一个Texture组件，Texture构造函数定义如下：

//const Texture({
//Key key,
//@required this.textureId,
//})

IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class CameraExampleHome extends StatefulWidget {
  CameraExampleHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CameraExampleHomeState createState() => _CameraExampleHomeState();
}

class _CameraExampleHomeState extends State<CameraExampleHome>
    with WidgetsBindingObserver {
  CameraController controller;
  String imagePath; // 图片保存路径
  String videoPath; //视频保存路径
  // VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;

  @override
  void initState() {
    // 监听APP状态改变，是否在前台
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 如果APP不在在前台
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // 在前台
      if (controller != null) {
       // onNewCameraSelected(controller.description);
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                      color: controller != null &&
                              controller.value.isRecordingVideo
                          ? Colors.redAccent
                          : Colors.grey,
                      width: 3.0)),
            ),
          ),
          _captureControlRowWidget(),
          _toggleAudioWidget(),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               // _cameraTogglesRowWidget(),
                _thumbnailWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 展示预览窗口
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Text(
        '选择一个摄像头',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }


  /// 开启或关闭录音
  Widget _toggleAudioWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: <Widget>[
          const Text('开启录音:'),
          Switch(
            value: enableAudio,
            onChanged: (bool value) {
              enableAudio = value;
              if (controller != null) {
               // onNewCameraSelected(controller.description);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _captureControlRowWidget() {

  }
  // 显示已拍摄的图片/视频缩略图。
   Widget _thumbnailWidget() {
    return Expanded(child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        children: [

        ],
      ),
    ));
   }
}
