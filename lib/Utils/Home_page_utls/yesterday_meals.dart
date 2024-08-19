// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class YesterdayMeals extends StatefulWidget {
  String meals;
  String cals;
  YesterdayMeals({
    Key? key,
    required this.meals,
    required this.cals,
  }) : super(key: key);

  @override
  State<YesterdayMeals> createState() => _YesterdayMealsState();
}

class _YesterdayMealsState extends State<YesterdayMeals> {
  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 17),
  child: Row(
    children: [
      Text(
        'Yesterday:',
        style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Text(
          widget.meals,
          style: TextStyle(
            fontSize: 17,
            color: AppColors.lite_green,
          ),
        ),
      ),
      Text(
        widget.cals,
        style: TextStyle(
          fontSize: 17,
          color: AppColors.lite_green,
        ),
      ),
    ],
  ),
);
  }
}