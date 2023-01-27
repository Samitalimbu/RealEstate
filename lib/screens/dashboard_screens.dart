import 'package:first/screens/bottom_screens/home_screens.dart';
import 'package:first/screens/bottom_screens/menu_screens.dart';
import 'package:first/screens/bottom_screens/profile_screen.dart';
import 'package:first/screens/bottom_screens/setting_screens.dart';
import 'package:first/screens/detail_screen.dart';

import 'package:flutter/material.dart';

class DashboardaScreen extends StatefulWidget {
  const DashboardaScreen({super.key});

  @override
  State<DashboardaScreen> createState() => _DashboardaScreenState();
}

class _DashboardaScreenState extends State<DashboardaScreen> {
  int _selectIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const SettingScreen(),
    const ProfileScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(
            () {
              _selectIndex = index;
            },
          );
        },
      ),
    );
   
  }
}
