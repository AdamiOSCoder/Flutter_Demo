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
      home: MyHomePage(title: 'TextFormField'),
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
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '用户名或邮箱',
                      icon: Icon(Icons.person)),
                  //校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : '用户名不能为空';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '您的登录密码',
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : '密码不能少于6位';
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                              padding: EdgeInsets.all(15), 
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Text('登录'),
                              onPressed: (){
                                //在这里不能通过此方式获取FormState，context不对
                                //print(Form.of(context));

                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((_formKey.currentContext as FormState).validate()) {
                                  //验证通过提交数据
                                }
                              }))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
