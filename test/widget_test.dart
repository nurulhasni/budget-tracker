// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:budget_tracker/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  // await Hive.initFlutter();
  // var box = await Hive.openBox('aniBox');
  // //key        //velue
  // box.put('name', 'Hasni');
  // print(box.get('name'));
  // int a = 1;
  // int b = 5;
  // for (int i = 1; i <= 5; i++) {
  //   if (a % 2 == 0) {
  //     prints("good");
  //   }
  //   int c = b * 2 % 2;
  //   if (c == 0) {
  //     print("very goood");
  //   }

  //   a++;
  //   b--;
  // }

  // int a = 10;
  // int b = 2;
  // int c = 0;

  // do {
  //   if (a % b == 0) {
  //     print("a $a");
  //     print("b $b");
  //     c = c + 2;
  //     print("ds $c");
  //     print("======================");
  //   } else {
  //     print("aa $a");
  //     print("bb $b");
  //     c = c + 1;
  //     print(c);
  //     print("===============");
  //   }
  //   a = a - 1;
  // } while (a >= 0);

  // for (int i = 1; i <= 100; i++) {
  //   if (i % 3 == 0) {
  //     print('BIZZ');
  //   } else if (i % 5 == 0) {
  //     print('BUZZ');
  //   } else if ((i % 3 == 0) && (i % 5 == 0)) {
  //     print("BIZZBUZZ");
  //   }

  // }
}
