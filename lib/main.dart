import 'package:flutter/material.dart';
import 'package:flutter_test01/richangshishi/MainMainRoute.dart';
import 'MainActivity.dart';
import 'TabBarViewDemo.dart';
import 'Text.dart';
import 'ScaffoldDemo.dart';
import 'NetworkDemo.dart';
import 'NotificationListenerDemo.dart';
import 'InterwovenAnimationDemo.dart';
import 'GradientButton.dart';
import 'TurnBox.dart';
import 'SwiperDemo.dart';
import 'richangshishi/MainWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainRoute();
//    return MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Scaffold(
//          appBar: AppBar(
//            // Here we take the value from the MyHomePage object that was created by
//            // the App.build method, and use it to set our appbar title.
//            title: Text('TEXT'),
//          ),
//          body: MeziList(),
//        )
//    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ScaleAnimationRoute(),
    );
  }
}

final List<String> items =
new List<String>.generate(20, (i) => "Item ${i + 1}");

class Dismiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return new Dismissible(
            key: Key(item),
            child: new GestureDetector(
              child: new ListTile(title: new Text('${items[index]}')),
              onTap: () {
                _navigateToSecondPage(context,item);
              },
            ),
            onDismissed: (DismissDirection direction) {
              items.removeAt(index);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('${item}被删除')));
            },
            background: new Container(color: Colors.red),
          );
        });
  }

}

//跳转第二个页面
_navigateToSecondPage(BuildContext context,String str)async{

  var result = await Navigator.push(context, new MaterialPageRoute(
      builder: (context) => new SecondPage(str)));

  Scaffold.of(context)
      .showSnackBar(SnackBar(content: Text(result),duration: Duration(milliseconds: 500)));
}

class SecondPage extends StatelessWidget {

  String name;

  SecondPage(this.name,{Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Second Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
        home: Scaffold(
          appBar: AppBar(

            title: Center(child: Text('Second Page ${name}')),
          ),
          body: Center(child: GestureDetector(
              onTap: () {
                Navigator.pop(context,"nihao lpf");
              },
              child: Text('放回页面')
          )
          ),
        )
    );
  }


}

// 路由A
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
          child: ClipOval(
            child: Image.asset("images/1.png",
              width: 50.0,
            ),
          ),
        ),
        onTap: () {
          //打开B路由
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              })
          );
        },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/1.png"),
      ),
    );
  }
}

//class TestA extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new CustomPaint();
//  }
//
//}