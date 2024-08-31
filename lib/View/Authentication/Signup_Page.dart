import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Text_Fields/login_signup.dart';
import 'package:slim_track/View/Authentication/Login_Page.dart';
import 'package:slim_track/View/Authentication/Profile_Build_Page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  
  get userId => null;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool isSignedin = false;
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    String userId = "";
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
              const Text("Sign up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: height*0.03,),
          
               MyLoginSignUpTextField(hintText: "Email Address",controller: emailController,obscureText: false,),
               MyLoginSignUpTextField(hintText: "Password",controller: passwordController,obscureText: true,),
               
          SizedBox(height:  height*0.02,),
              
              
              const SizedBox(width: 25,),
               MyAnimatedButton( ontap: (){
                 
              
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  if(formkey.currentState!.validate()){
                     auth.createUserWithEmailAndPassword(email: email, password: password).then((onValue){
                          userId = auth.currentUser!.uid;
                          

                      
                      firestore.collection("user").doc(userId).set({
                        "email": email,
                        "password": password
                      });
                    Get.to(() => const ProfileBuildPage());
                  }).onError((e, stackTrace){
                    Get.snackbar("Error", "$e");
                  });
                    
               
          
                }
                
               },firstText: "Sign up", secondText: "Signing up...",),
              TextButton(onPressed: (){
                Get.to(() => const LoginPage()
                  

                );
          
              }, child: const  Text("Already have an account? Log in",
                  style: TextStyle(color :AppColors.lite_green,fontSize: 16,fontWeight: FontWeight.bold),)),
          
          
              
          
            ],
          ),
        ),
      )
    );
  }
}