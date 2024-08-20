import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Buttons/Animated_button.dart';
import 'package:slim_track/Resources/Home_page_sections.dart/Profile_summary.dart';
import 'package:slim_track/Utils/Home_page_utls/Week_days.dart';
import 'package:slim_track/Utils/Home_page_utls/log_entries_home.dart';
import 'package:slim_track/Utils/Home_page_utls/yesterday_meals.dart';
import 'package:slim_track/View/HomePage/personal_info.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key,});

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    

    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),

              Container(
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
                      child: GestureDetector(
                        onTap: (){
                          Get.to(() => PersonalInfo());

                        },
                        child: Center(child: Image.asset("assets/images/user_image.png")))),
                      const SizedBox(width: 10,),

                      const Column(
                        children: [
                          Text("Welcome, Maisam!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text("You are on your way to a good start",style: TextStyle(fontSize: 16,),),
                        ],
                      ),
                                    
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              const Week_days(),

              // "My Tracker" UI Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      // Left side container
                      Flexible(
                        flex: 5,
                        child: Container(
                          height: 220, 
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
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Tracker',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10), // Reduced spacing
                              Row(
                                children: [
                                  Icon(Icons.show_chart, color: Colors.green, size: 50),
                                  SizedBox(width: 53),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Current weight',style: TextStyle(fontSize: 17),),
                                        SizedBox(
                                          width: 80,
                                          height: 40,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: '70kg',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Previous weight',style: TextStyle(fontSize: 17)),
                                        SizedBox(
                                          width: 80,
                                          height: 40,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: '90kg',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
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
                      // Right side containers
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            // Log Weight container
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
                                children: [
                                  const SizedBox(height: 10,),
                                  const Text("Log Weight", style: TextStyle(color: AppColors.black, fontSize: 18),),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        height: 35,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Type',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Love container
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
                              child: const Center(
                                child: Icon(Icons.shopping_cart, color: Colors.green, size: 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  height: height * 0.80, // Adjust height to prevent overflow
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView( // Added scroll to avoid overflow
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
                        YesterdayMeals(meals: "eggs", cals: "356"),
                        const SizedBox(height: 10),
                        LogEntriesHome(
                          text: "Lunch",
                          foodController: lunchController,
                          calController: lunchCaloriesController,
                        ),
                        YesterdayMeals(meals: "eggs", cals: "200"),
                        const SizedBox(height: 10),
                        LogEntriesHome(
                          text: "Dinner",
                          foodController: dinnerController,
                          calController: dinnerCaloriesController,
                        ),
                        YesterdayMeals(meals: "eggs", cals: "150"),
                        const SizedBox(height: 10),
                        LogEntriesHome(
                          text: "Snacks",
                          foodController: snacksController,
                          calController: snacksCaloriesController,
                        ),
                        YesterdayMeals(meals: "eggs", cals: "54"),
                        const SizedBox(height: 10),
                        LogEntriesHome(
                          text: "Drinks",
                          foodController: drinksController,
                          calController: drinksCaloriesController,
                        ),
                        YesterdayMeals(meals: "eggs", cals: "0"),
                        SizedBox(
                          height: 20,
                        ),
                        MyAnimatedButton(firstText: "Add", secondText: "Adding...", ontap: (){

                        }),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
