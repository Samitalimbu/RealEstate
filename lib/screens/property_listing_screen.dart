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
      body: SafeArea(child: Text(args["locationId"])),
    );
  }
}
