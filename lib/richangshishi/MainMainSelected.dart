import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'MainPageDataObj.dart';


class MainMainSelectedRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainMainSelectedState();
}



class MainMainSelectedState extends State<MainMainSelectedRoute>{

  List<ColumnBean> datas;

  Dio dio = new Dio();


  @override
  Widget build(BuildContext context) {

    var content ;
    if(datas.isEmpty){
      content =  new Center(child: new CircularProgressIndicator());;
    }else{
      print('lpf--datas.length--'+datas.length.toString());
      content = new ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: datas.length,
        itemBuilder: buildCardItem,
      );
    }

    var _refreshIndicator = new RefreshIndicator(
      onRefresh: _refreshData,
      child: content,
    );
    return _refreshIndicator;

  }

  //刷新时调用
  Future<Null> _refreshData(){

    final Completer<Null> completer = new Completer<Null>();

    _getDate().then((list) {
      setState(() {
        datas = list;
      });
    }).catchError((error) {
      print(error);
    });
    completer.complete(null);
    return completer.future;
  }

  Widget buildCardItem(BuildContext context,int index){
    return null;
  }


  Future<List<ColumnBean>>  _getDate() async{
    List columns;
    String url = 'https://api.shinshop.com/v1/apppages/layout?pageType=main&system_version=24&platform=ANDROID&sign=809352754F6D95A6A91227E520A1D955&access_token=55c2cac894f90db0efc3f2f3b384f38fdecb2615&suppress_response_code=true&version=16&device_model=MI%205&channel=richangshishi';
    print(url);
    Response response = await dio.get(url);
    if(response.statusCode== HttpStatus.OK){//响应成功
      columns = (response.data)['results'][0]['columns'] ;

    }else{//出问题

    }

    return columns.map((model) {
      return new ColumnBean.fromJson(model);
    }).toList();

  }

}



