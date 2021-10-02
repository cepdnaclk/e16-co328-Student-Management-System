import 'package:flutter/material.dart';
import 'package:mobile_app_for_students/home.dart';
import 'package:mobile_app_for_students/login_signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: '/home',
    //initialRoute: '/editProfile',
    routes: {
      '/': (context) => LoginScreen(),
      '/home': (context) => HomePage(),
    },
  ));
}
