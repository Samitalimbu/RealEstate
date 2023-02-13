import 'package:division/division.dart';
import 'package:first/model/property.dart';
import 'package:first/screens/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SeeScreen extends StatefulWidget {
  SeeScreen({super.key});

  @override
  State<SeeScreen> createState() => _SeeScreenState();
}

class _SeeScreenState extends State<SeeScreen> {
  dynamic? args;
  List<PropertyModel> propertiesList = [];

  @override
  void initState() {
    // TODO: implement initState
    //call node api to get all properties by location id

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffff5f5f3),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 120),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 670,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          final book = books[index];
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: 2,
                                          blurRadius: 14,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(book.imageUrl),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.location_on),
                                                Txt(book.location)
                                              ],
                                            ),
                                          ),
                                          Txt(
                                            "Home is sweet place for all of us  \n you can stay in peace and also ",
                                            style: TxtStyle()..fontSize(12),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          );
                        })),
              ],
            )),
      ),
    );
  }
}
