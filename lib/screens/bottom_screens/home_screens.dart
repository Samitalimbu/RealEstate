import 'dart:convert';

import 'package:division/division.dart';
import 'package:first/screens/home_list.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:first/widgets/item_widget.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    final Screen = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: Screen.height,
          width: Screen.width,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Txt(
                              "Hi  Mia !",
                              style: TxtStyle()
                                ..fontSize(14)
                                ..padding(left: 12)
                                ..fontWeight(FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Expanded(child: Icon(Icons.ring_volume)),
                    )
                  ],
                ),
                Txt(
                  "Welcome Back",
                  style: TxtStyle()
                    ..fontSize(22)
                    ..padding(right: 200)
                    ..fontWeight(FontWeight.bold),
                ),
                const SizedBox(height: 18),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Txt(
                  "Categories",
                  style: TxtStyle()
                    ..fontSize(18)
                    ..padding(right: 280)
                    ..fontWeight(FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 70,
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      _getCategoryInfo("what"),
                      _getCategoryInfo("House"),
                      _getCategoryInfo("Rooms"),
                      _getCategoryInfo("Buy"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Txt(
                        "Best Offers",
                        style: TxtStyle()
                          ..fontSize(22)
                          ..fontWeight(FontWeight.bold),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeListScreen()));
                        }),
                        child: Txt("See All",
                            style: TxtStyle()
                              ..textColor(Colors.grey)
                              ..fontSize(14)),
                      ),
                    ]),
                const SizedBox(height: 12),
                ImageSlideshow(
                  width: double.infinity,
                  height: 150,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  // called whenever the page in the center of the viewpoint changes.
                  onPageChanged: (value) {
                    // print('page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,

                  children: [
                    Image.asset(
                      'assets/images/house_Card1.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/house_Card2.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/house_Card1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: dummyList.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        item: dummyList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _getCategoryInfo(String title) {
  return Parent(
    style: ParentStyle()
      ..height(60)
      ..width(80)
      ..elevation(3, color: Colors.grey.withOpacity(0.5))
      ..margin(right: 14)
      ..borderRadius(all: 10)
      ..background.color(Colors.grey.shade100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Txt(
          title,
          style: TxtStyle()
            ..fontSize(12)
            ..fontWeight(FontWeight.bold)
            ..textColor(const Color(0xff76B5C5)),
        ),
      ],
    ),
  );
}
