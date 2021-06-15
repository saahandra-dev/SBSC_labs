import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/screens/sign_up.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
       Hero(
         tag: 'todo_logo',
         child: AnimatedSplashScreen(
          backgroundColor: Color(0xff1c222e),
          splash: Icon(
            Icons.check_circle,
            color: Color(0xff4ba9d1),
            size: 100.0,
            ),
          nextScreen: SignIn(),
          splashTransition: SplashTransition.sizeTransition
,
         // pageTransitionType: PageTransitionType.scale,
      ),
       );
  }
}