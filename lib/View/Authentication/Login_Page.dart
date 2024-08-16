import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Text_Fields/login_signup.dart';
import 'package:slim_track/View/Authentication/Profile_Build_Page.dart';
import 'package:slim_track/View/Authentication/Signup_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool isSignedin = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
          
            children: [
              SizedBox(height:  height*0.2,),
              Center(child: Image.asset("assets/images/splash_image.png")),
              SizedBox(height: height*0.03,),
              const Text("Log in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: height*0.03,),
          
               MyLoginSignUpTextField(hintText: "Username",controller: emailController,),
               MyLoginSignUpTextField(hintText: "Password",controller: passwordController,),
          
              TextButton(onPressed: (){}, child: const  Text("Forgot your password?",
              style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),
              
              const SizedBox(width: 25,),
              MyAnimatedButton(ontap: (){
          
                if(formkey.currentState!.validate()){
                  auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                    Get.to(() => const ProfileBuildPage());
                  }).onError((e,stackTrace){
                    Get.snackbar("Error", "$e");
                  });

                  
                }
                
              } ,firstText: "Login",secondText: "Logging in...",),
              TextButton(onPressed: (){
                Get.to(() => const SignupPage());
              }, child: const  Text("Create an account",
                  style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),
          
          
              
          
            ],
          ),
        ),
      )
    );
  }
}