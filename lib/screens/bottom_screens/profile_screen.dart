import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: Screen.height,
      width: Screen.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Txt("Profile",
                  style: TxtStyle()
                    ..fontSize(20)
                    ..padding(top: 18)
                    ..textColor(Colors.blue)
                    ..fontWeight(FontWeight.bold)),
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                      child: Image.asset(
                    "assets/images/circle_profile.png",
                    height: 300,
                    width: 280,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Center(
                    child: Container(
                        child: Image.asset(
                      "assets/images/profile1.png",
                      height: 400,
                      width: 500,
                    )),
                  ),
                ),
              ],
            ),
            Txt(
              "Full name",
              style: TxtStyle()
                ..fontSize(18)
                ..textColor(Colors.blue)
                ..fontWeight(FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(),
            ),
            SizedBox(height: 12),
            Txt(
              "Qualifications",
              style: TxtStyle()
                ..fontSize(18)
                ..textColor(Colors.blue)
                ..fontWeight(FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(),
            ),
            SizedBox(height: 12),
            Txt(
              "Phone number",
              style: TxtStyle()
                ..fontSize(18)
                ..textColor(Colors.blue)
                ..fontWeight(FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Parent(
                  style: ParentStyle()
                    ..height(50)
                    ..width(130)
                    ..borderRadius(all: 12)
                    ..background.color(Colors.blue),
                  child: Txt(
                    "Edit",
                    style: TxtStyle()
                      ..textColor(Colors.white)
                      ..alignmentContent.center()
                      ..fontSize(18),
                  ),
                ),
                Parent(
                  style: ParentStyle()
                    ..height(50)
                    ..width(130)
                    ..borderRadius(all: 12)
                    ..background.color(Colors.blue),
                  child: Txt(
                    "Save Changes",
                    style: TxtStyle()
                      ..textColor(Colors.white)
                      ..alignmentContent.center()
                      ..fontSize(18),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
