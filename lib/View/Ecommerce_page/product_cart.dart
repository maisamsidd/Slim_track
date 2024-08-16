import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Listing_tile.dart/cart.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.lite_20_green,

      appBar: AppBar( 
        backgroundColor: AppColors.lite_20_green,
        elevation: 0.0,
        titleSpacing: width*0.20,
        title: const Text("My Cart",style: TextStyle(color: AppColors.lite_green,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyCart(),
            const MyCart(),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Subtotal:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("47.98",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Tax:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("4.50",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Shipping:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("7.98",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Total:",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                Text("60.48",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
              ],),
            ),
            MyAnimatedButton(ontap: (){

            } ,firstText: "Proceed", secondText: "Please wait.."),
            const SizedBox(height: 40,)
          ],
        ),
      ),
      
    );
  }
}