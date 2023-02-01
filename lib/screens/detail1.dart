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
                top: 300,
                child: Container(
                  child: Txt(
                    book.detail,
                    style: TxtStyle()
                      ..fontSize(14)
                      ..padding(all: 16)
                      ..textColor(Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
