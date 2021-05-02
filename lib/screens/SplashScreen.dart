import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigationPage()
  {
    Navigator.of(context).pushReplacementNamed('/Home');
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState (){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center (
        child: Text('TaS',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 100,
        ),
        ),
      )
    );
  }
}