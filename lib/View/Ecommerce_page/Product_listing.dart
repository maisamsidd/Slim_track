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
            SizedBox(height: height * 0.03),
             ListingTile(price : 27.99,image: "assets/images/tea_bag.png",title: "Eclore Mint Tea", subtitle: "Milt Detox tea", ontapCart: () {
               Get.to(() => const ProductCart());
             }),
             ListingTile(price : 27.99,image: "assets/images/tea_bag.png",title: "Eclore Yummy Tea", subtitle: "Enjoy tea", ontapCart: () {
               Get.to(() => const ProductCart());
             }),
             ListingTile(price : 27.99,image: "assets/images/tea_bag.png",title: "Eclore Root Tea", subtitle: "Entence Detox tea", ontapCart: () {
               Get.to(() => const ProductCart());
             }),
             ListingTile(price : 27.99,image: "assets/images/tea_bag.png",title: "Eclore Detox Tea", subtitle: "Mega Detox tea", ontapCart: () {
               Get.to(() => const ProductCart());
             }),
            
            const Padding(
              padding: EdgeInsets.all(26.0),
              child: Text(
                'Hey friends, ready to flavour-packed adventure? '
                'Buckle up because we\'ve got some tea shots lined'
                ' up just for you! dive into our lineupof bold and'
                'vibrant blends each one\'s a little powerhouse of'
                'goodness, thanks a bunch for choosing eclore',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const BulletPoint(title: "SLIM MINT :", titleColor: AppColors.lite_green, description: " anti-oxidants, energy booster, herb taste",),
            const BulletPoint(title: "SWEET GINGER :", titleColor: Colors.red, description: " Step up your gut health game",),
            const BulletPoint(title: "BOLD BLEND :", titleColor: Colors.purple, description: "Weight loss enthusiast ",),
            const BulletPoint(title: "MEGA DETOX :", titleColor: Colors.brown, description: " You are planning to get pregnant should avoid this strong drink",),
           

          ],
        ),
      ),
    );
  }
}
