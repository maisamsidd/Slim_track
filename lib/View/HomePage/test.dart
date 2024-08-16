import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tabs Example'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.star), text: "Favorites"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Home Content")),
            Center(child: Text("Favorites Content")),
            Center(child: Text("Settings Content")),
          ],
        ),
      ),
    );
  }
}
