import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class MyAnimatedButton extends StatefulWidget {
  const MyAnimatedButton({super.key});

  @override
  State<MyAnimatedButton> createState() => _MyAnimatedButtonState();
}

class _MyAnimatedButtonState extends State<MyAnimatedButton> {
  bool isSignedin = false;
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
              onTap: (){
                setState(() {
                  isSignedin = true;
                });
                // isSignedin = false;
              },
              child: AnimatedContainer(duration: Duration(seconds: 2),
              width: isSignedin ? width*0.4 : width*0.87,
              height: height*0.07,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                
                color: AppColors.lite_green,
                
              ),
              child: Center(child: Text(isSignedin ? "Logging in..." : "login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            );
  }
}