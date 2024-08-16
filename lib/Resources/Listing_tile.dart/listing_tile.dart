import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/buy_and_cart_button.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({super.key});

  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
              width: width * 0.9, // Adjust the width based on screen size
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.gray_color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      child: SizedBox(
                        width: 80, // Adjust this value to increase the image size
                        height: 150, // Adjust this value to increase the image size
                        child: Image.asset(
                          "assets/images/tea_bag.png",
                          fit: BoxFit.contain, // You can also try BoxFit.cover or BoxFit.fill
                        ),
                      ),
                    ),
                   
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30), // Adjusted padding to prevent overflow
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Eclore mint tea",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              "Mild Detox tea",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              "12 bags",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            Spacer(), // Pushes the button to the bottom
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: BuyAndCartButton(
                                    text: "Buy",
                                  ),
                                  
                                ),
                                Expanded(
                                  child: BuyAndCartButton(
                                    text: "Add to cart",
                                  ),
                                  
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}