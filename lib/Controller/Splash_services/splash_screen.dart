import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:slim_track/View/Splash_Screen/Get_started.dart';

class Splash_Services {

  void splash (BuildContext context) async{
    Timer(const Duration(seconds: 5),(){

      Get.to(() => const GetStarted());
    });
  }

}