import 'package:first/screens/bottom_screens/home_screens.dart';
import 'package:first/screens/bottom_screens/profile_screen.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/detail1.dart';
import 'package:first/screens/detail_screen.dart';
import 'package:first/screens/googlemap_screen.dart';
import 'package:first/screens/home_list.dart';
import 'package:first/screens/login_screen.dart';
import 'package:first/screens/property_listing_screen.dart';
import 'package:first/screens/register_screen.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/walkthrough_screen.dart';
import 'package:first/screens/wearos/wear_dashboard_screen.dart';
import 'package:first/screens/wearos/wear_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/propertydetail',
            routes: {
              '/splash': (context) => const SplashScreen(),
              "/walkthrough": (context) => const WalkthroughScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/profile': (context) => ProfileScreen(),
              '/dashboard': (context) => const DashboardaScreen(),
              '/google': (context) => const GoogleMapScreen(),
              '/weardashboard': ((context) => const WearDashboardScreen()),
              '/wear': ((context) => const WearLoginScreen()),
              '/google': ((context) => const GoogleMapScreen()),
              '/dash': ((context) => HomeScreen()),
              '/home': ((context) => HomeScreen()),
              '/propertydetail': ((context) => PropertyListingScreen()),
              '/PropertyListingScreen': ((context) => PropertyListingScreen()),
            });
      },
    );
  }
}
