import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:slim_track/Resources/App_colors.dart/app_colors.dart';
import 'package:slim_track/Utils/profile_build_utils/first_widget.dart';
import 'package:slim_track/Utils/profile_build_utils/second_widget.dart';
import 'package:slim_track/View/HomePage/secret_gem.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic> _userInfo = {};

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    try {
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

  void _showUpdateDialog(String fieldName, String currentValue) {
    TextEditingController textFieldController = TextEditingController(text: currentValue);

    Get.dialog(
      AlertDialog(
        title: Text('Update $fieldName'),
        content: TextField(
          controller: textFieldController,
          decoration: InputDecoration(hintText: 'Enter new $fieldName'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _updateField(fieldName, textFieldController.text);
              Get.back(); // Close the dialog
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _updateField(String fieldName, String newValue) {
    FirebaseFirestore.instance.collection('user').doc(userId).update({
      fieldName: newValue,
    }).then((_) {
      setState(() {
        _userInfo[fieldName] = newValue;
      });
      Get.snackbar('Success', '$fieldName updated successfully!',
          snackPosition: SnackPosition.BOTTOM);
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to update $fieldName.',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Widget _buildInfoContainer(String fieldName, String label) {
    return GestureDetector(
      onTap: () {
        _showUpdateDialog(label, _userInfo[fieldName] ?? 'N/A');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 60,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              _userInfo[fieldName] ?? 'N/A',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lite_20_green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
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
              Text(
                _userInfo['firstName'] != null && _userInfo['lastName'] != null
                    ? '${_userInfo['firstName']} ${_userInfo['lastName']}'
                    : 'Loading...',
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                _userInfo['email'] ?? 'Loading...',
                style: const TextStyle(fontSize: 25),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FirstWidget(
                                        text:
                                            _userInfo['dateofBirth'] ?? 'N/A',
                                        imagePath:
                                            "assets/images/balloon_1.png"),
                                    FirstWidget(
                                        text: _userInfo['sex'] ?? 'N/A',
                                        imagePath:
                                            "assets/images/gender.png"),
                                    FirstWidget(
                                        text: _userInfo['height'] ?? 'N/A',
                                        imagePath:
                                            "assets/images/height.png"),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const SecondWidget(
                                    imagePath: "assets/images/cal.png"),
                                const SizedBox(height: 20),
                                Container(
                                  width: 370,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: AppColors.lite_green),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Membership type",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.black)),
                                      const SizedBox(width: 10),
                                      Text(
                                        _userInfo['goal'] ?? 'N/A',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.lite_green),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Align(
                                    alignment:
                                        AlignmentDirectional.centerStart,
                                    child: Text(
                                      "Daily history",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
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
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Text("Click to update the field", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              
                              _buildInfoContainer('firstName', 'firstName'),
                              _buildInfoContainer('lastName', 'lastName'),
                              _buildInfoContainer('goal', 'goal'),
                              _buildInfoContainer('height', 'height'),
                              _buildInfoContainer('weight', 'weight'),
                              _buildInfoContainer('dateofBirth', 'dateofBirth'),
                              _buildInfoContainer('phoneNumber', 'phoneNumber'),
                              _buildInfoContainer('targetWeight', 'targetWeight'),
                            ],
                          ),
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

  final TableRow tableRow = const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Date",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lite_green),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Lbs",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lite_green),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Meal",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lite_green),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Exercise",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lite_green),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Log",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lite_green),
        ),
      ),
    ],
  );
}
