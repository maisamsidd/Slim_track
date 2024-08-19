import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Resources/Home_page_sections.dart/Profile_summary.dart';
import 'package:slim_track/Utils/Home_page_utls/Week_days.dart';
import 'package:slim_track/Utils/Home_page_utls/log_entries_home.dart';
import 'package:slim_track/Utils/Home_page_utls/yesterday_meals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  void initState() {
    super.initState();
   
  }
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
              const ProfileSummary(),
              const SizedBox(height: 10),

              const SizedBox(height: 20),
              Week_days(),

              // Red containers (sample UI placeholders)
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 200,
                      color: Colors.red,
                      child: const Column(
                        children: [],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.red,
                          child: const Column(
                            children: [],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          color: Colors.red,
                          child: const Column(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
                  height: height * 0.75, 
                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)

                  ),// Adjust height to prevent overflow
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Today's log entries",style: TextStyle(color: AppColors.black,fontSize: 25),)),
                      ),
                      SizedBox(height: 8),
                      LogEntriesHome(text: "Breakfast", foodController: breakFastController, calController: breakFastCaloriesController),
                      YesterdayMeals(meals: "eggs", cals: "356"),
                      SizedBox(height: 10,),
                      LogEntriesHome(text: "Lunch", foodController: lunchController , calController: lunchCaloriesController),
                      YesterdayMeals(meals: "eggs", cals: "200"),
                      SizedBox(height: 10,),
                      LogEntriesHome(text: "Dinner", foodController: dinnerController, calController: dinnerCaloriesController),
                      YesterdayMeals(meals: "eggs", cals: "150"),
                      SizedBox(height: 10,),
                      LogEntriesHome(text: "Snacks", foodController: snacksController, calController: snacksCaloriesController),
                      YesterdayMeals(meals: "eggs", cals: "54"),
                      SizedBox(height: 10,),
                      LogEntriesHome(text: "Drinks", foodController: drinksController, calController: drinksCaloriesController),
                      YesterdayMeals(meals: "eggs", cals: "0"),
                      
                      
                      



                      
                      
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

