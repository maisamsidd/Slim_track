import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:slim_track/View/Authentication/Login_Page.dart';
import 'package:slim_track/View/Authentication/Signup_Page.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';
import 'package:slim_track/View/Splash_Screen/Get_started.dart';
import 'package:slim_track/View/Splash_Screen/Splash_screen.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted()
    );
  }
}