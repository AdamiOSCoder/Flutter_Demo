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
      home: ScaleAnimationRoute(title: 'Animation'),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  ScaleAnimationRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  //Tween 动画
//  initState() {
//    super.initState();
//    controller = new AnimationController(
//        duration: const Duration(seconds: 3), vsync: this);
//    //图片宽高从0变到300
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
//      ..addListener(() {
//        setState(()=>{});
//      });
//    //启动动画(正向执行)
//    controller.forward();
//  }

  //Curve，来实现一个类似于弹簧效果的动画过程
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    //启动动画
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("imgs/avatar.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}


//对动画的封装，用build
class AnimatedImage1 extends AnimatedWidget {
  AnimatedImage1({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("imgs/avatar.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }
}

//对动画的封装，用AnimatedBuilder

class AnimatedImage2 extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  AnimatedImage2({Key key, this.animation, this.child})
      : super(key: key);

  Widget build(BuildContext context) {
    //return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/avatar.png"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}

//  上面的代码中有一个迷惑的问题是，child看起来像被指定了两次。
//  但实际发生的事情是：将外部引用child传递给AnimatedBuilder后AnimatedBuilder再将其传递给匿名构造器，
//  然后将该对象用作其子对象。最终的结果是AnimatedBuilder返回的对象插入到widget树中。
//  也许你会说这和我们刚开始的示例差不了多少，其实它会带来三个好处：
//  不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。
//  动画构建的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，这将会导致父组件的build方法重新调用；
//  而有了builder之后，只会导致动画widget自身的build重新调用，避免不必要的rebuild。
//  通过AnimatedBuilder可以封装常见的过渡效果来复用动画。下面我们通过封装一个GrowTransition来说明，
//  它可以对子widget实现放大动画：

//class GrowTransition extends StatelessWidget {
//  GrowTransition({this.child, this.animation});
//
//  final Widget child;
//  final Animation<double> animation;
//
//  Widget build(BuildContext context) {
//    return new Center(
//      child: new AnimatedBuilder(
//          animation: animation,
//          builder: (BuildContext context, Widget child) {
//            return new Container(
//                height: animation.value,
//                width: animation.value,
//                child: child
//            );
//          },
//          child: child
//      ),
//    );
//  }
//}

//这样，最初的示例就可以改为：
//Widget build(BuildContext context) {
//  return GrowTransition(
//    child: Image.asset("images/avatar.png"),
//    animation: animation,
//  );
//}



