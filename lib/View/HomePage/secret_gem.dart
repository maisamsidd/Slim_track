import 'package:flutter/material.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class SecretGem extends StatelessWidget {
  const SecretGem({super.key});

  @override
  Widget build(BuildContext context) {
    TableRow tableRow = const TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Protein",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.red),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "State",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blue),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "(g)",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blue),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Micronutrients(Calories)",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blue),
          ),
        ),
        
      ],
    );
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: (){
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset("assets/images/splash_image.png"),
                ),
              ),
            ),

            // Text paragraph
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is a sample paragraph created for test purposes. It contains exactly fifty words, '
                'which makes it suitable for use in any Flutter application.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            // Tab
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: "Week 1 & 2"),
                        Tab(text: "Week 3 & 4"),
                        Tab(text: "Week 5 & 6"),
                      ],
                      indicatorColor: AppColors.lite_green,
                      labelColor: Colors.black,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    borderRadius: BorderRadius.circular(40),
                  elevation: 10,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: AppColors.lite_green),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
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
                                )
                                // Add your widgets for Week 1 & 2 here
                                
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    borderRadius: BorderRadius.circular(40),
                  elevation: 10,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: AppColors.lite_green),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
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
                                
                                // Add your widgets for Week 3 & 4 here
                               
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outlined,color: AppColors.lite_green,),
                        SizedBox(width: 10,),
                        Text("Unlimited access to all features",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    borderRadius: BorderRadius.circular(40),
                  elevation: 10,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: AppColors.lite_green),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
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
                                // Add your widgets for Week 5 & 6 here
                                
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
          ],
        ),
      ),
    );
  }
}
