import 'package:flutter/material.dart';

class MainMineRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainMineState();
}

class MainMineState extends State<MainMineRoute> {
  String AvatarUrl =
      'https://upload.jianshu.io/users/upload_avatars/15394287/d357324e-6d22-4050-937b-a77863b45a53?imageMogr2/auto-orient/strip|imageView2/1/w/80/h/80/format/webp';

  String UserName = 'lpf';

  String vipGrade = '青黛卡会员';

  String couponNum = '12';

  String integral = '24';

  String Prestorage = '23';

  TextStyle textStyle1;

  TextStyle textStyle2;

  @override
  void initState() {
    textStyle2 =
        TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600);

    textStyle1 = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getHeadView();
  }

  Widget getHeadView() {
    return Container(
      height: 160,
      color: Color(0xFF004D40),
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                      radius: 40, backgroundImage: NetworkImage(AvatarUrl)),
                  Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              UserName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 20,
                            //color: Colors.red,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Center(
                                child: Text(
                              vipGrade,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(10))
                ],
              )),
          Container(
            height: 60,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(couponNum, style: textStyle2),
                        Text('优惠券', style: textStyle1),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 1,
                  height: 40.0,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(couponNum, style: textStyle2),
                        Text('积分', style: textStyle1),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 1,
                  height: 40.0,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(couponNum, style: textStyle2),
                        Text('预存款', style: textStyle1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
