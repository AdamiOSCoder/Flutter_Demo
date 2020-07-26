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
      home: MyHomePage(title: '弹性布局Flex'),
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
    return Column(
      children: [
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.red,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.orange,
                )),
          ],
        ),

      ],
    );
    Padding(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 100,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
