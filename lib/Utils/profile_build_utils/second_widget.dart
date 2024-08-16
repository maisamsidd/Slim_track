// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';

class SecondWidget extends StatelessWidget {
  final String imagePath;
  const SecondWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                                  width: 350,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(color: AppColors.lite_green,),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child:  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                width: 28,  // Increased width
                height: 28, // Increased height
              ),
            ),
          ),
                                            const SizedBox(width: 10),
                                            const Flexible(
                                              child: Text(
                                                "Max Calories",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 18,
                                                ),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "1500",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.lite_green,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Star weight",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Flexible(
                                              child: Text(
                                                "174 lb",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 16,
                                                ),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Weight goal",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "174 lb",
                                                style: TextStyle(
                                                  color: AppColors.lite_green,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
  }
}
