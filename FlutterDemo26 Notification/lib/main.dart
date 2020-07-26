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
      home: NotificationRoute(title: 'BottomAppBar'),
    );
  }
}

class NotificationRoute extends StatefulWidget {
  NotificationRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationRoute createState() => _NotificationRoute();
}

class _NotificationRoute extends State<NotificationRoute> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>
      (onNotification:(notification) {
       setState(() {
         _msg+=notification.msg+' ';
       });
       return true;
    },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(builder: (context){
                return RaisedButton(
                  //按钮点击时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              }),
              Text(_msg)
            ],
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;

}