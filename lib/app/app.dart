import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/detail_screen.dart';
import 'package:first/screens/home_list.dart';
import 'package:first/screens/login_screen.dart';
import 'package:first/screens/register_screen.dart';
import 'package:first/screens/splash_screen.dart';
import 'package:first/screens/walkthrough_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/splash': (context) => const SplashScreen(),
        "/walkthrough": (context) => const WalkthroughScreen(),
        '/login': (context) => const LoginScreen(),
        '/': (context) => const RegisterScreen(),
        '/dash': ((context) => const DashboardaScreen()),
        '/home': ((context) => const HomeListScreen()),
        '/detail': ((context) => const DetailPageScreen()),
      },
    );
  }
}
