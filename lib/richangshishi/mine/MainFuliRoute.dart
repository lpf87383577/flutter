import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

//解析类
class FLModle{
  final String _id;
  final String createdAt;
  final String desc;
  final String publishedAt;
  final String source;
  final String type;
  final String url;
  final bool used;
  final String who;

  const FLModle(this._id, this.createdAt, this.desc, this.publishedAt, this.source,
      this.type, this.url, this.used, this.who);

  @override
  String toString() {
    return 'FLModle{_id: $_id, createdAt: $createdAt, desc: $desc, publishedAt: $publishedAt, source: $source, type: $type, url: $url, used: $used, who: $who}';
  }

  FLModle.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        createdAt = json['createdAt'],
        desc = json['desc'],
        publishedAt = json['publishedAt'],
        source = json['source'],
        type = json['publishedAt'],
        url = json['url'],
        used = json['used'],
        who = json['who'];
}

class MeziList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MeziSateList();
  }
}

class MeziSateList extends State<MeziList>{

  List<FLModle> datas = [];//初始化列表数据源
  int currentpage = 1;//默认当前页
  int pageSize = 10;//每页加载数据


  Dio dio = new Dio();//第三方网络加载库
  ScrollController _scrollController;

  //滑动到底了自动加载更多
  void _scrollListener(){
    if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
      _loadMoreData();
    }
  }

//页面初始化时加载数据并实例化ScrollController
  @override
  void initState() {
    super.initState();
    print('lpf-_MainFuliRoute-initState-');
    _refreshData();
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {

    var arr = [1, 2, 3, 4, 5];
    arr.add(1);

    print('lpf-build');
    var content ;
    if(datas.isEmpty){
      content =  new Center(child: new CircularProgressIndicator());
    }else{
      content = new ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: datas.length,
        controller: _scrollController,
        itemBuilder: buildCardItem,
      );
    }

    var _refreshIndicator = new RefreshIndicator(
      onRefresh: _refreshData,
      child: content,
    );
    return _refreshIndicator;
  }


  Widget buildCardItem(BuildContext context,int index){
    final String url = datas[index].url;
    return new GestureDetector(//点击事件
      onTap: (){

        //_showPhoto(url);
      },
      child: new Card(
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Image.network(url),
        ),
      ),
    );
  }

  //刷新时调用
  Future<Null> _refreshData(){

    final Completer<Null> completer = new Completer<Null>();
    currentpage = 1;
    feach(currentpage, pageSize).then((list) {
      print("lpf-_refreshData-finish");
      setState(() {
        datas = list;
      });
    }).catchError((error) {
      print(error);
    });
    completer.complete(null);
    return completer.future;
  }

  //加载更多时调用
  Future<Null> _loadMoreData(){

    final Completer<Null> completer = new Completer<Null>();


    feach(currentpage, pageSize).then((list) {
      setState(() {
        datas.addAll(list);
      });
    }).catchError((error) {
      print(error);
    });
    completer.complete(null);

    return completer.future;
  }

  Future<List<FLModle>> feach(int pageNum,int pageSize){
    return _getDate(pageNum, pageSize);
  }

  Future<List<FLModle>>  _getDate(int pageNum,int pageSize) async{
    List flModels;
    String url = 'http://gank.io/api/data/' + '福利/$pageSize/$pageNum';
    print(url);
    Response response = await dio.get(url);
    if(response.statusCode== HttpStatus.OK){//响应成功
      flModels = (response.data)['results'] ;
      currentpage = currentpage+1;//加载成功后才可加载下一页
    }else{//出问题
    }
    print(flModels.map((model) {
      return new FLModle.fromJson(model);
    }).toList().length);

    return flModels.map((model) {
      return new FLModle.fromJson(model);
    }).toList();

  }
}