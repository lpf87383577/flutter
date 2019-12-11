import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainMainSelected.dart';
import 'dart:ui';
import 'FlexViewPage.dart';

class MainMainRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainMainRouteState();
}

class MainMainRouteState extends State<MainMainRoute>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  TabController _tabController;
  Widget widgetDaohang;

  List<Tab> myTabs;

  @override
  void initState() {
    widgetDaohang = getDaohangView();
    myTabs = <Tab>[
      new Tab(text: '精选'),
      new Tab(text: '全部商品'),
      new Tab(text: '厨房调味'),
      new Tab(text: '粮油副食'),
      new Tab(text: '休闲小食'),
      new Tab(text: '安心果蔬'),
      new Tab(text: '水产海鲜'),
      new Tab(text: '肉禽蛋奶'),
    ];

    _tabController = TabController(length: myTabs.length, vsync: this);
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[widgetDaohang, getTabBar(), getTabView()],
    );
  }

  Widget getDaohangView() {
    return Container(
      padding: EdgeInsets.all(0),
      child: Container(
        height: 40,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                'images/ic_launcher.png',
                width: 30,
                height: 30,
              ),
            ),
            Text('烟台开发区'),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                'images/arrow_down.png',
                width: 15,
                height: 15,
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                child: Center(child: Text('想吃点什么')),
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            Image.asset(
              'images/icon_main_message.png',
              width: 40,
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget getTabBar() {
    return Container(
      height: 38.0,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.red,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black87,
        labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        indicatorWeight: 2.0,
        tabs: myTabs,
        controller: _tabController,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  Widget getTabView() {
    return Expanded(
        //color: Colors.red,
        child: FixTabBarView(
          pageController: _pageController,
          tabController: _tabController,
          children: <Widget>[
            Center(child: TestDialogRoute()),
            Center(child: Text("推荐11")),
            Center(child: Text("热销22")),
            Center(child: Text("推荐33")),
            Center(child: Text("热销44")),
            Center(child: Text("推荐55")),
            Center(child: Text("热销66")),
            Center(child: Text("推荐77")),
          ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    print("MainMainRoute--dispose");
    _tabController.dispose();
  }
}


class TestDialogRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return  Center(child: RaisedButton(onPressed: ()async{
      //弹出对话框并等待其关闭
      bool delete = await showDeleteConfirmDialog1(context);
      if (delete == null) {
        print("取消删除");
      } else {
        print("已确认删除");
      }

    },),);

  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Center(child: Container(width: 200,height: 150,color: Colors.red,),);
//          AlertDialog(
//          title: Text("提示"),
//          content: Text("您确定要删除当前文件吗?"),
//          actions: <Widget>[
//            FlatButton(
//              child: Text("取消"),
//              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
//            ),
//            FlatButton(
//              child: Text("删除"),
//              onPressed: () {
//                //关闭对话框并返回true
//                Navigator.of(context).pop(true);
//              },
//            ),
//          ],
//        );
      },
    );
  }

}


