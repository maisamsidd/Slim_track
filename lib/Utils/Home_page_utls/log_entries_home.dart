// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LogEntriesHome extends StatelessWidget {
  final String text;
  final TextEditingController foodController;
  final TextEditingController calController;
  LogEntriesHome({
    Key? key,
    required this.text,
    required this.foodController,
    required this.calController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 50,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: foodController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "eggs, milk, bread",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: calController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "100",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
  }
}
