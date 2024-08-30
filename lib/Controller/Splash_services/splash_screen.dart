import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';
import 'package:slim_track/View/Splash_Screen/Get_started.dart';

class Splash_Services {

  

  void splash (BuildContext context) async{
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;

        if(user != null){
          Timer(const Duration(seconds: 3), (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          });
        }else{
          Timer(const Duration(seconds: 3), (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const GetStarted()));
          });

        }

      

    
  }

}