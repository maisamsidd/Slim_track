import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  Map<String, dynamic> _userRoutine = {};
  int totalCals = 0; 
   final ImagePicker _picker = ImagePicker(); // Image picker instance
  String? _imageUrl; // To hold the selected image URL// Variable to hold the total calories

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
    _fetchUserRoutine();
  }

  Future<void> _fetchUserInfo() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fireStore.collection("user").doc(userId).get();

      if (documentSnapshot.exists) {
        setState(() {
          _userInfo = documentSnapshot.data()!;
        });
      } else {
        print('User document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _fetchUserRoutine() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fireStore.collection("routine_foods").doc(userId).get();

      if (documentSnapshot.exists) {
        setState(() {
          _userRoutine = documentSnapshot.data()!;
          // Calculate total calories here after fetching the data
          int bfCals = int.tryParse(_userRoutine['caloriesBreakFast'] ?? '0') ?? 0;
          int dinnerCals = int.tryParse(_userRoutine['caloriesDinner'] ?? '0') ?? 0;
          int lunchCals = int.tryParse(_userRoutine['caloriesLunch'] ?? '0') ?? 0;
          int snackCals = int.tryParse(_userRoutine['caloriesSnacks'] ?? '0') ?? 0;
          int drinkCals = int.tryParse(_userRoutine['caloriesDrinks'] ?? '0') ?? 0;

          totalCals = bfCals + dinnerCals + lunchCals + snackCals + drinkCals;
        });
      } else {
        print('Routine document does not exist');
      }
    } catch (e) {
      print('Error fetching routine data: $e');
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
    fireStore.collection('user').doc(userId).update({
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
   Future<void> _pickAndUploadImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // Upload to Firebase Storage
      final File file = File(image.path);
      final storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
      final uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {});

      // Get the download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Update Firestore with the image URL
      await fireStore.collection('user').doc(userId).update({
        'profileImageUrl': downloadUrl,
      });

      setState(() {
        _imageUrl = downloadUrl; // Update the local variable to reflect the new image
      });

      Get.snackbar('Success', 'Profile image updated successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error uploading image: $e');
      Get.snackbar('Error', 'Failed to upload profile image.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _pickAndUploadImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.lite_green,
        backgroundImage: _imageUrl != null
            ? NetworkImage(_imageUrl!) // Display uploaded image
            : const AssetImage("assets/images/user_image.png") as ImageProvider, // Default image
        child: _imageUrl == null
            ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 67),
              child:  Icon(Icons.add_a_photo, color: Colors.red),
            ) // Camera icon if no image is uploaded
            : null,
      ),
    );
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
    final fireData = FirebaseFirestore.instance
        .collection("routine_foods")
        .doc(userId)
        .collection("data")
        .snapshots();

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
                    child: _buildProfileImage()
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
                                SecondWidget(
                                  imagePath: "assets/images/cal.png",
                                  weightGoal: _userInfo['targetWeight'] ?? 'N/A',
                                  starWeirght: _userInfo['weight'] ?? 'N/A', 
                                  maxCals: totalCals.toString(), // Display total calories
                                ),
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
                                      InkWell(
                                        onTap: (){
                                          Get.to(() => const SecretGem());
                                        },
                                        child: Text(
                                          _userInfo['goal'] ?? 'N/A',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.lite_green),
                                        ),
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
                                  padding:  const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                            stream: fireData,
                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                              if (snapshot.hasError) {
                                                return const Text("Something went wrong");
                                              }
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
                                              }
                                              final data = snapshot.data?.docs;
                                              if (data == null || data.isEmpty) {
                                                return const Text("No data available");
                                              }
                                              return SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: DataTable(
                                                    border: TableBorder.all(),
                                                    columns: const [
                                                      DataColumn(label: Text('Date')),
                                                      DataColumn(label: Text('Log Weight')),
                                                      DataColumn(label: Text('All Meals')),
                                                      DataColumn(label: Text('Calories')),
                                                    ],
                                                    rows: data.map((doc) {
                                                      final date = doc['date'] ?? 'N/A';
                                                      final logWeight = doc['logWeight'] ?? 'N/A';
                                                      final allMeals = doc['breakfast'] +" ,"+ doc["lunch"]+" ,"+ doc["dinner"]+" ,"+ doc["snacks"]+" ,"+ doc["drinks"]?? 'N/A';
                                                      final calories = doc['caloriesDinner'] ?? 'N/A';
                                                      final totalCalories = int.parse(doc['caloriesDinner'] ?? '0') + int.parse(doc['caloriesLunch'] ?? '0') + int.parse(doc['caloriesBreakFast'] ?? '0') + int.parse(doc['caloriesSnacks'] ?? '0') + int.parse(doc['caloriesDrinks'] ?? '0');    
                                                      return DataRow(cells: [
                                                        DataCell(Text(date)),
                                                        DataCell(Text(logWeight)),
                                                        DataCell(Expanded(child: Text(softWrap: true,allMeals))),
                                                        DataCell(Text(totalCalories.toString())),
                                                      ]);
                                                    }).toList(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                _buildInfoContainer('firstName', 'firstName'),
                                _buildInfoContainer('lastName', 'lastName'),
                                _buildInfoContainer('email', 'email'),
                                _buildInfoContainer('phone', 'phone'),
                                _buildInfoContainer('weight', 'weight'),
                                _buildInfoContainer('height', 'height'),
                                _buildInfoContainer('targetWeight', 'targetWeight'),
                              ],
                            ),
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
}
