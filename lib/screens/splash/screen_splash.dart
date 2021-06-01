import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashState();
}

class SplashState extends State<SplashScreen>  with TickerProviderStateMixin{

  // final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: SplashState(),
  // )..repeat(reverse: true);
  //
  // final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  // );

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(

      ),
    );
  }
}

// ScaleTransition(
// scale: _animation,
// child: Container(
// padding: EdgeInsets.all(8),
// child: Image.asset("asset/images/ic_app.png"),
// ),



