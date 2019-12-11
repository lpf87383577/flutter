import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainMainRoute.dart';
import 'mine/MainMineRoute.dart';
import 'mine/MainFuliRoute.dart';

import 'DismissRoute.dart';

class MainRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainRouteState();
}

class MainRouteState extends State<MainRoute> {
  //下标
  int index = 0;

  TextStyle style = TextStyle(color: Colors.black87, fontSize: 12);

  List<BottomNavigationBarItem> list;

  List<Widget> pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    pages = <Widget>[
      new Offstage(
        offstage: index != 0,
        child: MainMainRoute(),
      ),
      new Offstage(
        offstage: index != 1,
        child: Dismiss(),
      ),
      new Offstage(
        offstage: index != 2,
        child: MeziList(),
      ),
      new Offstage(
        offstage: index != 3,
        child: HomeScreen(3),
      ),
      new Offstage(
        offstage: index != 4,
        child: MainMineRoute(),
      ),
    ];

    print('pages'+pages.toString());
    BottomNavigationBarItem b0 = BottomNavigationBarItem(
        icon: Image.asset(
            index == 0
                ? 'images/ic_tab_home_selected.png'
                : 'images/ic_tab_home_nomal.png',
            width: 20,
            height: 20),
        title: Text('首页', style: style));
    BottomNavigationBarItem b1 = BottomNavigationBarItem(
        icon: Image.asset(
            index == 1
                ? 'images/ic_tab_category_selected.png'
                : 'images/ic_tab_category_nomal.png',
            width: 20,
            height: 20),
        title: Text('分类', style: style));
    BottomNavigationBarItem b2 = BottomNavigationBarItem(
        icon: Image.asset(
            index == 2
                ? 'images/ic_tab_farmer_selected.png'
                : 'images/ic_tab_farmer_nomal.png',
            width: 20,
            height: 20),
        title: Text('时间煮语', style: style));
    BottomNavigationBarItem b3 = BottomNavigationBarItem(
        icon: Image.asset(
            index == 3
                ? 'images/ic_tab_cart_selected.png'
                : 'images/ic_tab_cart_nomal.png',
            width: 20,
            height: 20),
        title: Text('购物车', style: style));
    BottomNavigationBarItem b4 = BottomNavigationBarItem(
        icon: Image.asset(
            index == 4
                ? 'images/ic_tab_profile_selected.png'
                : 'images/ic_tab_profile_nomal.png',
            width: 20,
            height: 20),
        title: Text('我的', style: style));

    list = <BottomNavigationBarItem>[b0, b1, b2, b3, b4];

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Colors.lime,
            ),
            home: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQueryData.fromWindow(window).padding.top),
                  child: SafeArea(
                    top: true,
                    child: Offstage(),
                  ),
                ),
                body: Stack(
                  children: pages,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (int i) {
                    print(i.toString());
                    setState(() {
                      index = i;
                    });
                  },
                  items: list,
                  type: BottomNavigationBarType.fixed,
                ))));
  }
}

class HomeScreen extends StatefulWidget {
  int index;

  HomeScreen(int index, {Key key}) : super(key: key) {
    this.index = index;
  }

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME${widget.index}'),
      ),
    );
  }
}

