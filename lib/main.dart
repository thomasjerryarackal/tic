import 'package:flutter/material.dart';
import 'package:tic/screens/Layout4.dart';
import 'screens/SplashScreen.dart';
import 'screens/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => Home(),
      '/Layout4': (BuildContext context) => Layout4(),
    }

  ));
}



