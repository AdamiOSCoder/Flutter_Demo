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

//平台特定”或“特定平台”中的平台指的就是Flutter应用程序运行的平台，如Android或IOS。
//我们知道一个完整的Flutter应用程序实际上包括原生代码和Flutter代码两部分。
//由于Flutter本身只是一个UI系统，它本身是无法提供一些系统能力，比如使用蓝牙、相机、GPS等，
//因此要在Flutter APP中调用这些能力就必须和原生平台进行通信。
//为此，Flutter中提供了一个平台通道（platform channel），用于Flutter和原生平台的通信。
//平台通道正是Flutter和原生之间通信的桥梁，它也是Flutter插件的底层基础设施。

//Flutter与原生之间的通信依赖灵活的消息传递方式：
//应用的Flutter部分通过平台通道（platform channel）
//将消息发送到其应用程序的所在的宿主（iOS或Android）应用（原生应用）。
//宿主监听平台通道，并接收该消息。然后它会调用该平台的API，
//并将响应发送回客户端，即应用程序的Flutter部分。

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      )
    );
  }
}
