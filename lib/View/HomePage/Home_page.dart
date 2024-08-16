// import 'package:flutter/material.dart';
// import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
// import 'package:slim_track/Resources/Home_page_sections.dart/7_days.dart';
// import 'package:slim_track/Resources/Home_page_sections.dart/Profile_summary.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lite_20_green,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [

//               const SizedBox(height: 25),
//               const ProfileSummary(),
//               const SizedBox(height: 10),
//               const WeekDays(),
//               const SizedBox(height:20 ,),
        
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 270,
//                       height: 200,
//                       color: Colors.red,
//                       child: const Column(
                    
//                         children: [
                         
//                         ],
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                     width: 120,
//                     height: 100,
//                     color: Colors.red,
//                     child: const Column(
                  
//                       children: [
                       
//                       ],
//                     ),
                    
//                   ),
//                   const SizedBox(height: 10,),
//                   Container(
//                     width: 120,
//                     height:100,
//                     color: Colors.red,
//                     child: const Column(
                  
//                       children: [
                       
//                       ],
//                     ),
//                   ),
//                     ],
//                   )
              
                  
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Material(
//                     borderRadius: BorderRadius.circular(40),
//                   elevation: 10,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: "Search",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(40),
//                         borderSide: const BorderSide(color: AppColors.lite_green),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     const Text("Breakfast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                     Slider(
                      
//                       min: 1,
//                       max: 100,
                
//                   activeColor: AppColors.lite_green,
                
                
//                   value: 0.4,
//                   onChanged: (value) {
                    
//                   })
//                   ],
//                 ),
//               )
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  
// }
