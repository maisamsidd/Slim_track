import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Utils/profile_build_utils/first_widget.dart';
import 'package:slim_track/Utils/profile_build_utils/second_widget.dart';
import 'package:slim_track/View/Authentication/Mothly_plan_page/monthly_plan_page.dart';
import 'package:slim_track/View/HomePage/secret_gem.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TableRow tableRow = const TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Date",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.lite_green),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Lbs",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.lite_green),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Meal",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.lite_green),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Calories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.lite_green),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: (){
                    Get.to(() => const SecretGem());
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.lite_green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset("assets/images/user_image.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sarah Tyler",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "sarahtyler@test.com",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: "Personal Info"),
                        Tab(text: "Edit"),
                      ],
                      indicatorColor: AppColors.lite_green,
                      labelColor: Colors.black,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.8,
                      ),
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                 const SizedBox(height: 20),
                                 const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FirstWidget(text: "26 June",imagePath: "assets/images/balloon_1.png",),
                                    FirstWidget(text: "Female",imagePath: "assets/images/gender.png"),
                                    FirstWidget(text: "5'4",imagePath: "assets/images/height.png"),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const SecondWidget(imagePath: "assets/images/cal.png",),
                                const SizedBox(height: 20,),
                                Container(
                                  width: 370,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(color: AppColors.lite_green)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Membersip type",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.black),),
                                      const SizedBox(width: 10,),
                                       InkWell(
                                        onTap: (){
                                          Get.to(() => const MonthlyPlanPage());
                                        },
                                        child: const Text("Monthly (auto renew)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.lite_green),)),

                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                               
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      "Daily history",
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      child: Table(
                                        
                                        
                                        children: <TableRow>[
                                          
                                          tableRow,
                                          tableRow,
                                          tableRow,
                                          tableRow,
                                          tableRow,
                                          tableRow,
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Center(child: Text("Edit Content")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
