import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Controller/Splash_services/splash_screen.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/View/Authentication/Signup_Page.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final splash = Splash_Services();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height*0.2,),
          Center(
            child: Image.asset("assets/images/splash_image.png"),
          ),
          SizedBox(height: height*0.08,),
          const Text("Slim Track",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          SizedBox(height: height*0.06,),

          const Text("Track your weight",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          const Text("and Stay healthy",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          SizedBox(height: height*0.06,),

          MyAnimatedButton( ontap: (){
            Get.to(() => const SignupPage());
          },firstText: "Get Started",secondText: "Getting Started...",),
        ],
      )
    );
  }
}