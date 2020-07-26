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
      home: MyHomePage(title: 'ListView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

//  ListView({
//  //可滚动widget公共参数
//  Axis scrollDirection = Axis.vertical,
//  bool reverse = false,
//  ScrollController controller,
//  bool primary,
//  ScrollPhysics physics,
//  EdgeInsetsGeometry padding,
//
//  //ListView各个构造函数的共同参数
//  double itemExtent,
//  bool shrinkWrap = false,
//  bool addAutomaticKeepAlives = true,
//  bool addRepaintBoundaries = true,
//  double cacheExtent,
//
//  //子widget列表
//  List<Widget> children = const <Widget>[],
//  })

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = [loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              _retrieveData();
            }
            //加载时显示loading
            return Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(
              height: .0,
            ),
        itemCount: _words.length);
  }

//  @override
//  Widget build(BuildContext context) {
//    return Column(children: <Widget>[
//      ListTile(title:Text("商品列表")),
//      Expanded(
//        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
//          return ListTile(title: Text("$index"));
//        }),
//      ),
//    ]);
//  }


  _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
//        _words.insertAll(_words.length - 1,
//            //每次生成20个单词
//            generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
//        );
      });
    });
  }
}
