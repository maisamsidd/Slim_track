import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Buttons/profile_build_textfield.dart';
import 'package:slim_track/Resources/Text_Fields/profileTextFeild.dart';
import 'package:slim_track/View/HomePage/personal_info.dart';

class ProfileBuildPage extends StatelessWidget {
  const ProfileBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.05),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(hintText: "First name"),
                  Profiletextfeild(hintText: "Last name"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(hintText: "Date of birth"),
                  Profiletextfeild(hintText: "Phone number"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(hintText: "Sex"),
                  Profiletextfeild(hintText: "Height"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(hintText: "Weight"),
                  Profiletextfeild(hintText: "Target weight"),
                ],
              ),
              const Text(
                  "Goal",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.lite_green),
                ),
                const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileBuildTextButton(text: "Lose weight"),
                  ProfileBuildTextButton(text: "Maintain weight "),
                ],
              ),
              SizedBox(height: height * 0.05,),
          
              MyAnimatedButton(ontap: (){

                Get.to(() => const PersonalInfo());
              } ,firstText: "Create Account", secondText: "Creating...")
          
             
            ],
          ),
        ),
      ),
    );
  }
}
