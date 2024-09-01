import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Utils/Home_page_utls/Week_days.dart';
import 'package:slim_track/Utils/Home_page_utls/log_entries_home.dart';
import 'package:slim_track/Utils/Home_page_utls/yesterday_meals.dart';
import 'package:slim_track/View/Authentication/Login_Page.dart';
import 'package:slim_track/View/HomePage/personal_info.dart';
import 'package:slim_track/View/Products_page/products_listing.dart';
import 'package:lottie/lottie.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final breakFastController = TextEditingController();
  final breakFastCaloriesController = TextEditingController();
  final lunchController = TextEditingController();
  final lunchCaloriesController = TextEditingController();
  final dinnerController = TextEditingController();
  final dinnerCaloriesController = TextEditingController();
  final snacksController = TextEditingController();
  final snacksCaloriesController = TextEditingController();
  final drinksController = TextEditingController();
  final drinksCaloriesController = TextEditingController();

  final currentWeightController = TextEditingController();
  final previousController = TextEditingController();
  final logController = TextEditingController();

  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Map<String, dynamic> _userInfo = {};
  Map<String, dynamic> _userRoutine = {};

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
    _fetchUserRoutine();
  }

  @override
  void dispose() { super.dispose(); }

  Future<void> _fetchUserRoutine() async {
    try {
      final userId = auth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fireStore.collection("routine_foods").doc(userId).get();

      if (documentSnapshot.exists) {
        setState(() {
          _userRoutine = documentSnapshot.data()!;
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
   Future<void> _fetchUserInfo() async {
    try {
            final userId = auth.currentUser!.uid;

      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection("user").doc(userId).get();

      if (documentSnapshot.exists) {
        setState(() {
          _userInfo = documentSnapshot.data()!;
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userId = auth.currentUser?.uid;
    


      if (userId == null) {
    // Delay the navigation to avoid issues with widget rebuilding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAll(() => const LoginPage());
    });
  
  }
    
  
    void logWeight()async{
     await fireStore.collection("user").doc(userId).update({
      "currentWeight" : logController.text,
    });

  }
  int currentWeight = int.parse(_userInfo['currentWeight'] ?? '0') ?? 0;
  int previousWeight = int.parse(_userInfo['weight'] ?? '0');

  Widget getArrow(){
    if(currentWeight>previousWeight){
      return Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
        ),
        child: Expanded(child: Lottie.asset("assets/Animations/arrow_up.json",fit: BoxFit.fill)));
    }
    else{
      return SizedBox(
        width: 100,
        height: 100,
        child: Lottie.asset("assets/Animations/arrow_down.json"));
    }

  }

  
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GestureDetector(
  onTap: () {
    Get.to(() => const PersonalInfo());
  },
  child: CircleAvatar(
    radius: 50,
    backgroundImage: _userInfo['profileImageUrl'] != null
        ? NetworkImage(_userInfo['profileImageUrl']!)
        : AssetImage("assets/images/user_image.png") as ImageProvider,
  ),
),
                  const SizedBox(width: 10),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Hello, ",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _userInfo['firstName'] ?? 'Loading...',
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Text(
                        "You are on your way to a good start",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(onTap: (){

                           auth.signOut();
                                               
                          Get.to(() => const LoginPage());
                              
                            
                            
                          },
                            child: const Text("Logout",style: TextStyle(fontSize: 16,color: Colors.red),)),
                    ],
                  ),
                  
                ],
              ),
              const SizedBox(height: 20),
              const Week_days(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Tracker',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                getArrow(),

                                //If value is greater than weight then use assets/Animations/arrow_up,
                                //  else assets/Animations/arrow_down
                                
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Current weight', style: TextStyle(fontSize: 17)),
                                      SizedBox(
                                        width: 80,
                                        height: 40,
                                        child: Text(_userInfo['currentWeight'] ?? "o", style: const TextStyle(fontSize: 18,color: AppColors.lite_green),)
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Previous weight', style: TextStyle(fontSize: 17)),
                                      SizedBox(
                                        width: 80,
                                        height: 40,
                                        child: Text( _userInfo['weight'] ?? "0", style: const TextStyle(fontSize: 18,color: AppColors.lite_green),)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: 105,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Log Weight",
                                  style: TextStyle(color: AppColors.black, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 35,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: logController,
                                      decoration: const InputDecoration(
                                        hintText: 'Type',
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter current weight';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 105,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child:  Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() =>   const ListingOfProducts());
                                },
                                child: const Icon(Icons.shopping_cart, color: Colors.green, size: 40)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reminders",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Today's log entries",
                            style: TextStyle(color: AppColors.black, fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      LogEntriesHome(
                        text: "Breakfast",
                        foodController: breakFastController,
                        calController: breakFastCaloriesController,
                      ),
                      YesterdayMeals(
                        meals: _userRoutine['breakfast'] ?? 'Loading...',
                        cals: _userRoutine['caloriesBreakFast'] ?? 'Loading...',
                      ),
                      const SizedBox(height: 10),
                      LogEntriesHome(
                        text: "Lunch",
                        foodController: lunchController,
                        calController: lunchCaloriesController,
                      ),
                      YesterdayMeals(
                        meals: _userRoutine['lunch'] ?? 'Loading...',
                        cals: _userRoutine['caloriesLunch'] ?? 'Loading...',
                      ),
                      const SizedBox(height: 10),
                      LogEntriesHome(
                        text: "Dinner",
                        foodController: dinnerController,
                        calController: dinnerCaloriesController,
                      ),
                      YesterdayMeals(
                        meals: _userRoutine['dinner'] ?? 'Loading...',
                        cals: _userRoutine['caloriesDinner'] ?? 'Loading...',
                      ),
                      const SizedBox(height: 10),
                      LogEntriesHome(
                        text: "Snacks",
                        foodController: snacksController,
                        calController: snacksCaloriesController,
                      ),
                      YesterdayMeals(
                        meals: _userRoutine['snacks'] ?? 'Loading...',
                        cals: _userRoutine['caloriesSnacks'] ?? 'Loading...',
                      ),
                      const SizedBox(height: 10),
                      LogEntriesHome(
                        text: "Drinks",
                        foodController: drinksController,
                        calController: drinksCaloriesController,
                      ),
                      YesterdayMeals(
                        meals: _userRoutine['drinks'] ?? 'Loading...',
                        cals: _userRoutine['caloriesDrinks'] ?? 'Loading...',
                      ),
                      const SizedBox(height: 20),


                      MyAnimatedButton(ontap: (){
                         logWeight();
                         var currentTime = DateTime.now();
                          var formattedTime = "${currentTime.hour}:${currentTime.minute}";
                          var formattedDate = "${currentTime.day}/${currentTime.month}/${currentTime.year}";

                            void logNullSafety() async {
                            if (logController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter your current weight",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                              return;
                            }}
  

                        fireStore.collection("routine_foods").doc(userId).set({
                          "breakfast": breakFastController.text,
                          "caloriesBreakFast": breakFastCaloriesController.text,
                          "lunch": lunchController.text,
                          "caloriesLunch": lunchCaloriesController.text,
                          "dinner": dinnerController.text,
                          "caloriesDinner": dinnerCaloriesController.text,
                          "snacks": snacksController.text,
                          "caloriesSnacks": snacksCaloriesController.text,
                          "drinks": drinksController.text,
                          "caloriesDrinks": drinksCaloriesController.text,
                          'currentWeight' : logController.text,

                          
                        });
                         fireStore.collection("routine_foods").doc(userId).collection("data").add({
                           "breakfast": breakFastController.text,
                          "caloriesBreakFast": breakFastCaloriesController.text,
                          "lunch": lunchController.text,
                          "caloriesLunch": lunchCaloriesController.text,
                          "dinner": dinnerController.text,
                          "caloriesDinner": dinnerCaloriesController.text,
                          "snacks": snacksController.text,
                          "caloriesSnacks": snacksCaloriesController.text,
                          "drinks": drinksController.text,
                          "caloriesDrinks": drinksCaloriesController.text,
                          'currentWeight' : logController.text,
                          'logWeight' : logController.text,
                          'date' : formattedDate,
                          'time' : formattedTime,
                         });
                         setState(() {
                           breakFastController.clear();
                           breakFastCaloriesController.clear();
                           lunchController.clear();
                           lunchCaloriesController.clear();
                           dinnerController.clear();
                           dinnerCaloriesController.clear();
                           snacksController.clear();
                           snacksCaloriesController.clear();
                           drinksController.clear();
                           drinksCaloriesController.clear();
                           logController.clear();
                         });
                         Navigator.push(context, MaterialPageRoute(builder:  (context) => const HomePage()));


                      },firstText: "Add",secondText: "Adding...",),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );

    
  }
  
}
