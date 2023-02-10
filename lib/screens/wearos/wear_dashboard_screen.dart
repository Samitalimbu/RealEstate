import 'package:division/division.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WearDashboardScreen extends StatefulWidget {
  const WearDashboardScreen({super.key});

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
            child: Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      Txt(
                        "Welcome to Mero Ghar",
                        style: TxtStyle()
                          ..fontSize(12)
                          ..padding(left: 14)
                          ..fontWeight(FontWeight.bold)
                          ..textColor(const Color(0xff557A95)),
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: 30,
                      )
                    ],
                  ),
                ),
                Parent(
                  style: ParentStyle()
                    ..height(26)
                    ..width(70)
                    ..elevation(4)
                    ..padding(left: 16)
                    ..borderRadius(all: 8)
                    ..background.color(Color.fromARGB(255, 234, 231, 231)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.room,
                        size: 12,
                      ),
                      Txt("Room",
                          style: TxtStyle()
                            ..fontSize(8)
                            ..textColor(const Color(0xff557A95))),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Parent(
                  style: ParentStyle()
                    ..height(26)
                    ..width(76)
                    ..elevation(4)
                    ..padding(left: 16)
                    ..borderRadius(all: 8)
                    ..background.color(Color.fromARGB(255, 234, 231, 231)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.apartment,
                        size: 12,
                      ),
                      Txt("Apartments",
                          style: TxtStyle()
                            ..fontSize(8)
                            ..textColor(const Color(0xff557A95))),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Parent(
                  style: ParentStyle()
                    ..height(26)
                    ..width(70)
                    ..elevation(4)
                    ..padding(left: 16)
                    ..borderRadius(all: 8)
                    ..background.color(Color.fromARGB(255, 234, 231, 231)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.house,
                        size: 12,
                      ),
                      Txt("House",
                          style: TxtStyle()
                            ..fontSize(8)
                            ..textColor(const Color(0xff557A95))),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Parent(
                  style: ParentStyle()
                    ..height(26)
                    ..width(70)
                    ..elevation(4)
                    ..padding(left: 16)
                    ..borderRadius(all: 8)
                    ..background.color(Color.fromARGB(255, 234, 231, 231)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bed,
                        size: 12,
                      ),
                      Txt("Rooms",
                          style: TxtStyle()
                            ..fontSize(8)
                            ..textColor(const Color(0xff557A95))),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Row(
                    children: [
                      Txt(
                        "We provide the best house for you ",
                        style: TxtStyle()
                          ..fontSize(8)
                          ..padding(left: 22)
                          ..fontWeight(FontWeight.bold)
                          ..textColor(const Color(0xff557A95)),
                      ),
                      Image.asset(
                        "assets/images/namaste.png",
                        height: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
