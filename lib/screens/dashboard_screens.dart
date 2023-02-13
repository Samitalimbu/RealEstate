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
    HomeScreen(),
    // const SettingScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: lstBottomScreen[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
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
      ),
    );
  }
}
