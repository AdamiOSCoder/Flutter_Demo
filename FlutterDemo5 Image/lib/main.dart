import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: '各种Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//  const Image({
//  ...
//  this.width, //图片的宽
//  this.height, //图片高度
//  this.color, //图片的混合色值
//  this.colorBlendMode, //混合模式
//  this.fit,//缩放模式
//  this.alignment = Alignment.center, //对齐方式
//  this.repeat = ImageRepeat.noRepeat, //重复方式
//  ...
//  })

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              '在pubspec.yaml中的flutter部分添加如下内容：' +
                  'assets:' +
                  '- images/avatar.png',
              maxLines: 5,
            ),

            //加载本地图片
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100.0
            ),

            Image.asset("images/avatar.png",
              width: 100.0,
            ),

            //从网络加载图片
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),

            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            )
          ],
        )));
  }
}
//自定义Icon
//class MyIcons{
//  // book 图标
//  static const IconData book = const IconData(
//      0xe614,
//      fontFamily: 'myIcon',
//      matchTextDirection: true
//  );
//  // 微信图标
//  static const IconData wechat = const IconData(
//      0xec7d,
//      fontFamily: 'myIcon',
//      matchTextDirection: true
//  );
//}


//使用自定义Icon
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Icon(MyIcons.book,color: Colors.purple,),
//Icon(MyIcons.wechat,color: Colors.green,),
//],
//)

