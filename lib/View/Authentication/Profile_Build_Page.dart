import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Buttons/profile_build_textfield.dart';
import 'package:slim_track/Resources/Text_Fields/profileTextFeild.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';

class ProfileBuildPage extends StatefulWidget {
  final  userId;
  final email;

  const ProfileBuildPage({super.key,  required this.userId, required this.email});

  @override
  _ProfileBuildPageState createState() => _ProfileBuildPageState();
}

class _ProfileBuildPageState extends State<ProfileBuildPage> {
  final firestore = FirebaseFirestore.instance;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateofBirthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();

  String selectedGoal = 'Lose weight'; // Default goal selection

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(
                      hintText: "First name",
                      controller: firstNameController),
                  Profiletextfeild(
                      hintText: "Last name", controller: lastNameController),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(
                      hintText: "Date of birth",
                      controller: dateofBirthController),
                  Profiletextfeild(
                      hintText: "Phone number",
                      controller: phoneNumberController),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(
                      hintText: "Sex", controller: sexController),
                  Profiletextfeild(
                      hintText: "Height", controller: heightController),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Profiletextfeild(
                      hintText: "Weight", controller: weightController),
                  Profiletextfeild(
                      hintText: "Target weight",
                      controller: targetWeightController),
                ],
              ),
              const Text(
                "Goal",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lite_green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGoal = 'Lose weight';
                      });
                    },
                    child: ProfileBuildTextButton(
                      text: "Lose weight",
                      isSelected: selectedGoal == 'Lose weight',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGoal = 'Maintain weight';
                      });
                    },
                    child: ProfileBuildTextButton(
                      text: "Maintain weight",
                      isSelected: selectedGoal == 'Maintain weight',
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              MyAnimatedButton(
                  ontap: () {
                    firestore.collection("user").doc(widget.userId).set({
                      "userId": widget.userId,
                      "firstName": firstNameController.text,
                      "lastName": lastNameController.text,
                      "dateofBirth": dateofBirthController.text,
                      "phoneNumber": phoneNumberController.text,
                      "sex": sexController.text,
                      "height": heightController.text,
                      "weight": weightController.text,
                      "targetWeight": targetWeightController.text,
                      "goal": selectedGoal,
                      "email": widget.email
                       // Save selected goal to Firestore
                    });

                    Get.to(() => const HomePage());
                  },
                  firstText: "Create Account",
                  secondText: "Creating..."),
            ],
          ),
        ),
      ),
    );
  }
}
