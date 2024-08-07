import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class MyLoginSignUpTextField extends StatelessWidget {
  final hintText;
   MyLoginSignUpTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: AppColors.lite_green,width: 2), // default border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const  BorderSide(color: AppColors.lite_green,width: 2), // enabled border color
      ),
      focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: AppColors.lite_green,width: 2), // focused border color
      ),
    ),
  ),
);
  }
}