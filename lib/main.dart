import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_app/screens/main/screen_main.dart';
import 'package:qrcode_app/screens/result/screen_result.dart';
import 'package:qrcode_app/utils/SharePreferenceUtils.dart';

import 'db/database_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.cyan,
    Colors.purple,
    Colors.pink,
    Colors.lime
  ];

  int indexColor = 0;

  void loadData() async {
    await SharePreferenceUtils.init();
    indexColor = SharePreferenceUtils.getColorTheme();
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: colors[indexColor]),
      home: MainScreen(),
      routes: {ResultScreen.routeName: (context) => ResultScreen()},
    );
  }
}
