import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class FirstWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const FirstWidget({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lite_green),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                width: 28,  
                height: 28, 
              ),
            ),
          ),
          // Add spacing between the image and text if needed
          Text(
            text,
            style: const TextStyle(
              color: AppColors.lite_green,fontSize: 17
            ),
          ),
        ],
      ),
    );
  }
}
