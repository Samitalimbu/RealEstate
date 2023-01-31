import 'package:division/division.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WearDashboardScreen extends StatefulWidget {
  const WearDashboardScreen({super.key});

  static const String route = "wearDashboardScreen";

  @override
  State<WearDashboardScreen> createState() => _WearDashboardScreenState();
}

class _WearDashboardScreenState extends State<WearDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (
        context,
        mode,
        child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Center(
                    child: Txt(
                      "Welcome to Mero Ghar",
                      style: TxtStyle()
                        ..fontSize(14)
                        ..fontWeight(FontWeight.bold)
                        ..textColor(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
