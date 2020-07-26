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
      home: MyHomePage(title: '流式布局'),
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
        body: Wrap(
      spacing: 0.8, // 主轴(水平)方向间距
      runSpacing: 4, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: [
        Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
            label: Text('AAAAAA'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('B'),
          ),
          label: Text('BBBBBB'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('C'),
          ),
          label: Text('CCCCCC'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('D'),
          ),
          label: Text('DDDDDD'),
        ),
      ],
    ));
  }
}
