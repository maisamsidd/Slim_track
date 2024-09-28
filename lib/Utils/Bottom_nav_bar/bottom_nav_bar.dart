import 'package:flutter/material.dart';
import 'package:slim_track/View/HomePage/Home_page.dart';
import 'package:slim_track/View/HomePage/personal_info.dart';
import 'package:slim_track/View/HomePage/secret_gem.dart';
import 'package:slim_track/View/Products_page/products_listing.dart';



class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  // List of pages to show
  final List _pages = [
    const HomePage(),
    const PersonalInfo(),
    const ListingOfProducts(),
    const SecretGem()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],  // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,  // Track the current selected index
        onTap: _onItemTapped,          // Change index when tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Secret gem',
          ),
        ],
      ),
    );
  }
}
