import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';

class Splash_Services {

  void splash (BuildContext context) async{
    Timer(Duration(seconds: 3),(){

      Get.to(() => HomePage());
    });
  }

}