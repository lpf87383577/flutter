// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test01/main.dart';

void main() {

  print("开始时间"+currentTimeMillis().toString());

  Future.wait([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results){
    print(results[0]+results[1]);
    print("结束时间"+currentTimeMillis().toString());
  }).catchError((e){
    print(e);
  });
}

int currentTimeMillis() {
  return new DateTime.now().millisecondsSinceEpoch;
}