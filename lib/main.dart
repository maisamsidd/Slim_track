// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slim_track/View/Authentication/Profile_Build_Page.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';
import 'package:slim_track/View/HomePage/personal_info.dart';
import 'package:slim_track/View/Splash_Screen/Splash_screen.dart';
import 'package:slim_track/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
