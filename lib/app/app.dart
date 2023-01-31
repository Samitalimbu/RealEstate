import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/detail_screen.dart';
import 'package:first/screens/googlemap_screen.dart';
import 'package:first/screens/home_list.dart';
import 'package:first/screens/login_screen.dart';
import 'package:first/screens/register_screen.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/walkthrough_screen.dart';
import 'package:first/screens/wearos/wear_dashboard_screen.dart';
import 'package:first/screens/wearos/wear_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/splash': (context) => const SplashScreen(),
              "/walkthrough": (context) => const WalkthroughScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/': ((context) => const WearDashboardScreen()),
              '/wearlogin': ((context) => const WearLoginScreen()),

              '/google': ((context) => const GoogleMapScreen()),

              'dashboard': ((context) => const DashboardaScreen()),

              // '/home': ((context) => const HomeListScreen()),
              '/detail': ((context) => const DetailPageScreen()),
            });
      },
    );
  }
}
