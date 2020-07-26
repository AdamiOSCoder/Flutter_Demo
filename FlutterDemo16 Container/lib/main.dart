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
      home: MyHomePage(title: 'Container'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 120),
        constraints: BoxConstraints.tightFor(width: 200, height: 150), //卡片大小
        decoration: BoxDecoration(
            //背景装饰
            gradient: RadialGradient(
              //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
          //卡片阴影
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2), //卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
        child: Text( //卡片文字
          "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}
