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
      home: MyHomePage(title: '文本，字体样式'),
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
  final Str = 'Home:https://flutterchina.club';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Text(
              'Hello world',
              textAlign: TextAlign.left,
            ),
            Text(
              'Hello world' * 6, //字符串重复6次
              maxLines: 1, //显示一行
              overflow: TextOverflow.ellipsis, //超过一行截取方式
            ),
            Text(
              'Hello world',
              textScaleFactor: 1.5, //文字大小
            ),
            Text(
              'Hello world',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  height: 1.2,
                  //行高是个因子，具体用fontSize * height
                  fontFamily: 'Courier',
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            //显示不同的样式，截取
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Home:'),
              TextSpan(
                  text: 'https://flutterchina.club',
                  style: TextStyle(color: Colors.blue),
                recognizer: _tapRecognizer(),
              ),

            ]))
          ],
        )
    );
  }

  //点击链接调用
  _tapRecognizer (){

  }
}
