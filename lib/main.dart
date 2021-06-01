import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_app/screens/main/screen_main.dart';
import 'package:qrcode_app/screens/result/screen_result.dart';
import 'package:qrcode_app/screens/splash/screen_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      routes: {
        ResultScreen.routeName: (context)=> ResultScreen()
      },
    );
  }
}

