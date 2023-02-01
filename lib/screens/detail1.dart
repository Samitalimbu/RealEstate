import 'package:division/division.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPageScreen1 extends StatelessWidget {
  final Book book;
  DetailPageScreen1(this.book);

  @override
  Widget build(BuildContext context) {
    final Screen = MediaQuery.of(context).size;
    return Material(
        child: Scaffold(
      backgroundColor: const Color(0xfff2f1f2),
      body: SingleChildScrollView(
        child: Container(
          height: 264,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(
              book.imageUrl,
            )),
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                height: 100,
                width: 366,
                top: 200,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          book.title,
                          style: TxtStyle()
                            ..fontSize(17)
                            ..textColor(const Color(0xffcccacc))
                            ..fontWeight(FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Txt(
                              book.location,
                              style: TxtStyle()
                                ..textColor(Color.fromARGB(255, 202, 196, 202))
                                ..fontSize(14),
                            ),
                            const Icon(
                              Icons.room,
                              color: Colors.blue,
                              size: 16,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.bed),
                                Txt(
                                  "Bed",
                                  style: TxtStyle()
                                    ..padding(left: 2, right: 8)
                                    ..fontSize(14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.bed),
                                Txt(
                                  "Bed",
                                  style: TxtStyle()
                                    ..padding(left: 2, right: 8)
                                    ..fontSize(14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.bed),
                                Txt(
                                  "Bed",
                                  style: TxtStyle()
                                    ..padding(left: 2, right: 8)
                                    ..fontSize(14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 300,
                child: Container(
                  child: Column(
                    children: [
                      Txt(
                        book.detail,
                        style: TxtStyle()
                          ..fontSize(14)
                          ..padding(all: 16)
                          ..textColor(Colors.black),
                      ),
                      Txt(
                        "Gallery",
                        style: TxtStyle()
                          ..fontSize(18)
                          ..fontWeight(FontWeight.bold)
                          ..padding(right: 550)
                          ..textColor(Colors.black),
                      ),
                      SizedBox(height: 14),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _getCategoryInfo(""),
                            _getCategoryInfo(""),
                            _getCategoryInfo(""),
                            _getCategoryInfo(""),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 642,
                          color: const Color(0xfff2f1f2),
                          child: const ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile1.png"),
                            ),
                            title: Txt("Riya Shrestha(0wner)"),
                            subtitle: Text(
                              "The apartments consists of two bedrooms, a bathroom, \n a kitchen and a living room is located in Zadar, 800 m from Maestrala Beach, and provides a patio, garden, and free WiFi. This apartment is 2.2 km \n from Puntamika Beach and 29 km from Kornati Marina.",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          child: const Text('Message'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget _getCategoryInfo(String image) {
  return Parent(
      style: ParentStyle()
        ..height(60)
        ..width(80)
        ..elevation(3, color: Colors.grey.withOpacity(0.5))
        ..margin(right: 74)
        ..borderRadius(all: 10),
      child: Image.asset(
        "assets/images/House2.jpg",
        fit: BoxFit.cover,
      ));
}
