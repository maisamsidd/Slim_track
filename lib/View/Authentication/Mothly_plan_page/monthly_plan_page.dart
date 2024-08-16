import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Monthly_plans/monthly_plans.dart';

class MonthlyPlanPage extends StatelessWidget {
  const MonthlyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lite_20_green,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.04,),
              const Center(child: Text("Select a plan", style: TextStyle(color: AppColors.lite_green, fontSize: 30),)),
               SizedBox(height: height*0.03,),
               const MonthlyPlans(),
               const SizedBox(height: 20,),
               const MonthlyPlans(),
               const SizedBox(height: 20,),
               const MonthlyPlans(),
             
            ],
          ),
        ),
      ),

    );
  }
}