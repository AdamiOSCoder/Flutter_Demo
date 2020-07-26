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
      home: MyHomePage(title: '层叠布局'),
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
        body: ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        //fit: StackFit.expand, //未定位widget占满Stack整个空间
        alignment: Alignment.center,
        children: [
          Container(
            child: Text(
              'Hello world',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          Positioned(left: 18, child: Text('I am Jack')),
          Positioned(top: 18, child: Text("Your friend"))
        ],
      ),
    ));
  }
}
