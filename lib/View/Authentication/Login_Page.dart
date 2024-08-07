import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Text_Fields/login_signup.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool isSignedin = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(height:  height*0.2,),
            Center(child: Image.asset("assets/images/splash_image.png")),
            SizedBox(height: height*0.03,),
            Text("Log in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: height*0.03,),
        
            MyLoginSignUpTextField(hintText: "Username",),
            MyLoginSignUpTextField(hintText: "Password",),

            TextButton(onPressed: (){}, child: const  Text("Forgot your password?",
            style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),
            
            SizedBox(width: 25,),
            MyAnimatedButton(),
            TextButton(onPressed: (){}, child: const  Text("Create an account",
                style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),


            
        
          ],
        ),
      )
    );
  }
}