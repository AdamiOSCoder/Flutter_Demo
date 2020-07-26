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


//const FlatButton({
//  ...
//  @required this.onPressed, //按钮点击回调
//  this.textColor, //按钮文字颜色
//  this.disabledTextColor, //按钮禁用时的文字颜色
//  this.color, //按钮背景颜色
//  this.disabledColor,//按钮禁用时的背景颜色
//  this.highlightColor, //按钮按下时的背景颜色
//  this.splashColor, //点击时，水波动画中水波的颜色
//  this.colorBrightness,//按钮主题，默认是浅色主题
//  this.padding, //按钮的填充
//  this.shape, //外形
//  @required this.child, //按钮的内容
//})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            RaisedButton(child: Text('RaiseButton'), onPressed: _raiseBtnClick),
            RaisedButton.icon(
                onPressed: _raiseBtnClick,
                icon: Icon(Icons.send),
                label: Text('发送')),
            FlatButton(onPressed: _flatBtnClick, child: Text('FlatButton')),
            FlatButton.icon(
                onPressed: _raiseBtnClick,
                icon: Icon(Icons.send),
                label: Text('发送')),
            OutlineButton(
                child: Text('OutlineButton'), onPressed: _outLineBtnClick),
            OutlineButton.icon(
                onPressed: _outLineBtnClick,
                icon: Icon(Icons.add),
                label: Text('添加')),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: _iconBtnClick),

            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: _floatingActionBtnClick),
          ],
        ));
  }

  _raiseBtnClick() {}

  _flatBtnClick() {}

  _outLineBtnClick() {}

  _iconBtnClick() {}

  _floatingActionBtnClick() {}
}

