import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Model/UserModel/cart_model.dart';
import 'package:slim_track/Model/UserModel/product_listing.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/buy_and_cart_button.dart';
import 'package:slim_track/View/Ecommerce_page/product_cart.dart';
import 'package:slim_track/View/Products_page/cart_listing.dart';

class ListingOfProducts extends StatefulWidget {
  const ListingOfProducts({super.key});

  @override
  State<ListingOfProducts> createState() => _ListingOfProductsState();
}

class _ListingOfProductsState extends State<ListingOfProducts> {
  @override
  Widget build(BuildContext context) {
    List<ProductListingModel> cartItems = [
      ProductListingModel(
          title: "Eclored ice",
          price: 27.99,
          fixedPrice: 27.99,
          subtitlee: "Milt Detox tea",
          image: "assets/images/tea_bag.png",
          bags: 1),
      ProductListingModel(
          title: "Eclored mint",
          price: 19.99,
          subtitlee: "Enjoy tea",
          fixedPrice: 17.99,
          image: "assets/images/tea_bag.png",
          bags: 1),
      ProductListingModel(
          title: "Eclored tea",
          fixedPrice: 17.99,
          price: 25.99,
          subtitlee: "Entence Detox tea",
          image: "assets/images/tea_bag.png",
          bags: 1),
      ProductListingModel(
          title: "Eclored tea",
          fixedPrice: 20.99,
          price: 23.99,
          subtitlee: "Eclore Detox Tea",
          image: "assets/images/tea_bag.png",
          bags: 1),
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final fireStore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;

    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      appBar: AppBar(
        backgroundColor: AppColors.lite_20_green,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    Get.to(() => CartListing());
                  },
                  child: const Icon(Icons.shopping_cart,
                      color: AppColors.lite_green, size: 30)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
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
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var title = cartItems[index].title.toString();
                  var subtitle = cartItems[index].subtitlee.toString();
                  var image = cartItems[index].image.toString();
                  var price = cartItems[index].price;
                  var bags = cartItems[index].bags;
                  var fixedPrice = cartItems[index].fixedPrice;

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: width * 0.90,
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              child: SizedBox(
                                width: 80,
                                height: 150,
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      subtitle,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      "$bags bags",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: BuyAndCartButton(
                                            ontap: () {},
                                            text: "Buy",
                                          ),
                                        ),
                                        Expanded(
                                          child: BuyAndCartButton(
                                            ontap: () async {
                                              final existingItem = await fireStore
                                                  .collection("cartItems")
                                                  .doc(userId)
                                                  .collection("items")
                                                  .where("title",
                                                      isEqualTo: title)
                                                  .get();

                                              if (existingItem.docs.isEmpty) {
                                                await fireStore
                                                    .collection("cartItems")
                                                    .doc(userId)
                                                    .collection("items")
                                                    .add({
                                                  "title": title,
                                                  "subtitle": subtitle,
                                                  "image": image,
                                                  "price": price,
                                                  "bags": bags,
                                                  "fixedPrice": fixedPrice
                                                });

                                                Get.snackbar("Success",
                                                    "$title added to cart",
                                                    colorText: AppColors.black,
                                                    backgroundColor:
                                                        AppColors
                                                            .lite_20_green);
                                              } else {
                                                Get.snackbar("Notice",
                                                    "$title is already in your cart.",
                                                    colorText: AppColors.black,
                                                    backgroundColor:
                                                        Colors.yellow);
                                              }
                                            },
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
