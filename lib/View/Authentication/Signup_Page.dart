import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Text_Fields/login_signup.dart';
import 'package:slim_track/View/Authentication/Login_Page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isSignedin = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(height:  height*0.2,),
            Center(child: Image.asset("assets/images/splash_image.png")),
            SizedBox(height: height*0.03,),
            const Text("Sign up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: height*0.03,),
        
             MyLoginSignUpTextField(hintText: "Email Address",controller: emailController,),
             MyLoginSignUpTextField(hintText: "Password",controller: passwordController,),
             
SizedBox(height:  height*0.02,),
            
            
            const SizedBox(width: 25,),
             MyAnimatedButton( ontap: (){
              void signUpUser(){

              }
              
             },firstText: "Sign up", secondText: "Signing up...",),
            TextButton(onPressed: (){
              Get.to(() => const LoginPage());

            }, child: const  Text("Already have an account? Log in",
                style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),


            
        
          ],
        ),
      )
    );
  }
}