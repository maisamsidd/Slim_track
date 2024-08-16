import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Listing_tile.dart/listing_page_text.dart';
import 'package:slim_track/Resources/Listing_tile.dart/listing_tile.dart';
import 'package:slim_track/View/Ecommerce_page/product_cart.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      appBar: AppBar(
        backgroundColor: AppColors.lite_20_green,
        elevation: 0.0,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Get.to(() => const ProductCart());
                },
                child: const Icon(Icons.shopping_cart, color: AppColors.lite_green, size: 30)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Real results by real people",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            const ListingTile(),
            const ListingTile(),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is a sample paragraph created for demonstration purposes. It contains exactly fifty words, '
                'which makes it suitable for use in any Flutter application. The goal is to show how text can be '
                'displayed effectively within a Flutter app, ensuring readability and clarity for the user.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const BulletPoint(title: "SLIM MINT :", titleColor: AppColors.lite_green, description: " anti-oxidants, energy booster, herb taste",),
            const BulletPoint(title: "SLIM MINT :", titleColor: Colors.red, description: " anti-oxidants, energy booster, herb taste",),
            const BulletPoint(title: "SLIM MINT :", titleColor: Colors.purple, description: " anti-oxidants, energy booster, herb taste",),
            const BulletPoint(title: "SLIM MINT :", titleColor: Colors.brown, description: " anti-oxidants, energy booster, herb taste",),
           

          ],
        ),
      ),
    );
  }
}
