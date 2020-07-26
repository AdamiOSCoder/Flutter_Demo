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
      home: TapboxA(title: '自己状态管理'),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            decoration: BoxDecoration(
                color: _active ? Colors.lightGreen[700] : Colors.grey[600]
            ),
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
