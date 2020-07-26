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

//  GridView({
//    Axis scrollDirection = Axis.vertical,
//    bool reverse = false,
//    ScrollController controller,
//    bool primary,
//    ScrollPhysics physics,
//    bool shrinkWrap = false,
//    EdgeInsetsGeometry padding,
//    @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
//    bool addAutomaticKeepAlives = true,
//    bool addRepaintBoundaries = true,
//    double cacheExtent,
//    List<Widget> children = const <Widget>[],
//  })

  //        GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3, //横轴三个子widget
//        childAspectRatio: 1.0 //宽高比为1时，子widget
//    ),
//    children:<Widget>[
//    Icon(Icons.ac_unit),
//    Icon(Icons.airport_shuttle),
//    Icon(Icons.all_inclusive),
//    Icon(Icons.beach_access),
//    Icon(Icons.cake),
//    Icon(Icons.free_breakfast)
//    ]
//    );

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _icons = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return
          GridView.builder(
              itemCount: _icons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //每行三列
                  childAspectRatio: 1.0 //显示区域宽高相等
                  ),
              itemBuilder: (context, index) {
                //如果显示到最后一个并且Icon总数小于200时继续获取数据
                if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                }
                return Icon(_icons[index]);
              });
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 10)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
