import 'package:flutter/material.dart';
import 'package:slim_track/Controller/Splash_services/splash_screen.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splash = Splash_Services();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.splash(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/splash_image.png"),
          ),
          SizedBox(height: 40,),
          Text("Slim Track",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
        ],
      )
    );
  }
}