import 'package:flutter/material.dart';
import 'package:flutter_app/myDrawer.dart';

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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('导航'),
          //将AppBar的leading设置为菜单按钮（如上面截图所示），点击它便可打开抽屉菜单。
          // 如果我们想自定义菜单图标，可以手动来设置leading
//          leading: Builder(builder: (context) {
//            return IconButton(icon: Icon(Icons.dashboard),color: Colors.white, onPressed: (){
//              Scaffold.of(context).openDrawer();  // 打开抽屉菜单
//            });
//          }),

          //导航栏右侧菜单
          actions: [IconButton(icon: Icon(Icons.share), onPressed: () {

          })],
        ),
        //抽屉
        drawer: new MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd(){
  }
}
