import 'package:first/model/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PropertyListingScreen extends StatefulWidget {
  PropertyListingScreen({super.key});

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen> {
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
                  child: Icon(Icons.arrow_back),
                ),
                Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
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
                                child: Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blue,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Korea"),
                                              Text(
                                                  "Hello beautiful people with the beautiful city \n hahaha this is a beautiful city")
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("4,7"),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        })),
              ],
            )),
      ),

      // child: Text(args["locationId"])))),
    );
  }
}
