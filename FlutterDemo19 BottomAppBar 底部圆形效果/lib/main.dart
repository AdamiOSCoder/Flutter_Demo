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
      home: MyHomePage(title: 'BottomAppBar'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞,

        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: null),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business), onPressed: null),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
//实际上，打洞的位置取决于FloatingActionButton的位置，上面FloatingActionButton的位置为
//  BottomAppBar的shape属性决定洞的外形，CircularNotchedRectangle实现了一个圆形的外形，
//  我们也可以自定义外形
}
