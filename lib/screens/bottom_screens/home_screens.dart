import 'dart:convert';

import 'package:division/division.dart';
import 'package:first/model/locations.dart';
import 'package:first/repository/location_repository.dart';
import 'package:first/screens/detail_screen.dart';
import 'package:first/screens/home_list.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:first/screens/property_listing_screen.dart';
import 'package:first/screens/see_all.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../detail1.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchField = TextEditingController();

  List<Location> _locations = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final actualHeight = height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
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
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                  controller: searchField,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Search"),
                  onChanged: (value) {
                    LocationRepositoryImpl()
                        .getLocationBasedOnSearch(value)
                        .then((value) {
                      setState(() {
                        _locations = value;
                      });
                      print('location: $value');
                    });
                  }),
            ),
          ),
          _locations.isNotEmpty
              ? Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: _locations.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(_locations[index].id);
                          Navigator.pushNamed(context, '/PropertyListingScreen',
                              arguments: {"locationId": _locations[index].id});
                        },
                        child: Container(
                          // width: double.infinity,
                          // height: 40,
                          alignment: Alignment.centerLeft,
                          // margin:
                          //     const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text('${_locations[index].name}'),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Txt(
            "Categories",
            style: TxtStyle()
              ..fontSize(18)
              ..padding(right: 280)
              ..fontWeight(FontWeight.bold),
          ),
          SizedBox(
            height: 70,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _getCategoryInfo("To Buy"),
                _getCategoryInfo("To Sell"),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Txt(
              "Best Offers",
              style: TxtStyle()
                ..fontSize(22)
                ..fontWeight(FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeeScreen()));
              },
              child: Txt("See All",
                  style: TxtStyle()
                    ..textColor(Colors.grey)
                    ..fontSize(14)),
            ),
          ]),
          Container(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final book = books[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => DetailPageScreen1(book),
                        transition: Transition.leftToRight);
                  },
                  child: Container(
                    width: 370,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            //borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                            child: Image.asset(
                              book.imageUrl,
                              width: 160,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                  ),
                                  child: Column(
                                    children: [
                                      Txt(book.title,
                                          style: TxtStyle()
                                            ..padding(right: 82, bottom: 6)
                                            ..fontWeight(FontWeight.bold)
                                            ..fontSize(14)),
                                      Row(
                                        children: [
                                          Txt(book.location,
                                              style: TxtStyle()
                                                ..padding(bottom: 6, left: 8)
                                                ..fontSize(14)),
                                          const Icon(
                                            Icons.my_location,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                      Txt(book.detail,
                                          style: TxtStyle()
                                            ..padding(
                                                right: 26, bottom: 6, left: 8)
                                            ..fontSize(14)),
                                      Row(
                                        children: [
                                          Text(
                                            book.rating,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Column(
            children: [
              Txt(
                "Recommendations",
                style: TxtStyle()
                  ..fontSize(16)
                  ..padding(right: 230)
                  ..fontWeight(FontWeight.bold),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 26),
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              books[index].imageUrl,
                              height: 135,
                              width: 150,
                            ),
                            Text(books[index].title, maxLines: 1),
                            Text(
                              books[index].detail,
                              maxLines: 1,
                            ),
                            const Text(
                              "Readmore",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}

Widget _getCategoryInfo(String title) {
  return Parent(
    style: ParentStyle()
      ..height(60)
      ..width(130)
      ..elevation(3, color: Colors.grey.withOpacity(0.5))
      ..margin(right: 32, left: 32)
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
