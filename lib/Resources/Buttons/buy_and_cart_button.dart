import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class BuyAndCartButton extends StatelessWidget {
  final String text;
  const BuyAndCartButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Container(
          width: 150,  // Adjusted to match text fields
          height: 50,  // You can adjust this to match the height you prefer
          decoration: BoxDecoration(
            color: AppColors.lite_20_green,
            borderRadius: BorderRadius.circular(12),  // Match the border radius with the text fields
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,              
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
