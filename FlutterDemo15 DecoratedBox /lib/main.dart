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
      home: MyHomePage(title: 'DecoratedBox'),
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
        Container(
          width: 100,
            height: 50,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                    //背景渐变
                    borderRadius: BorderRadius.circular(3.0),
                    //3像素圆角
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white)
                  ),
                )
            )
        )
      ],
    );
  }
}
