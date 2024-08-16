import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.lite_green,
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                      child: Center(child: Image.asset("assets/images/user_image.png"))),
                      const SizedBox(width: 10,),

                      const Column(
                        children: [
                          Text("Welcome, Maisam!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("You are on your way to a good start",style: TextStyle(fontSize: 16,),),
                        ],
                      ),
                                    
                  ],
                ),
              );
  }
}