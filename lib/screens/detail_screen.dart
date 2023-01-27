import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPageScreen extends StatefulWidget {
  const DetailPageScreen({super.key});

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
    double blur = isPressed ? 5.0 : 5.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 440,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/house_Card1.jpeg",
                        
                      ),
                      fit: BoxFit.fill)),
            ),
            
          ),
          Positioned(
            top: 400,
            child: Container(
              height: 500,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Txt(
                        "Kathmandu",
                        style: TxtStyle()..margin(left: 30, top: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 22,
                        ),
                      )
                    ],
                  ),
                  Txt(
                    "Detail Oriented House",
                    style: TxtStyle()
                      ..fontSize(18)
                      ..margin(right: 166, top: 8)
                      ..fontWeight(FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 244, top: 12),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 20,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        _getCategoryInfo("1 Bathroom"),
                        _getCategoryInfo("1 kitchen"),
                        _getCategoryInfo("2 rooms"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile1.png"),
                    ),
                    title: Txt("Riya Shrestha(0wner)"),
                    subtitle: Text(
                      "The apartments consists of two bedrooms, a bathroom, a kitchen and a living room is located in Zadar, 800 m from Maestrala Beach, and provides a patio, garden, and free WiFi. This apartment is 2.2 km from Puntamika Beach and 29 km from Kornati Marina.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Txt(
                          "Rs 39000",
                          style: TxtStyle()
                            ..fontWeight(FontWeight.bold)
                            ..fontSize(18),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromARGB(255, 148, 153, 164),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: blur,
                                  offset: distance,
                                  color: Color.fromARGB(255, 194, 191, 191),
                                ),
                                BoxShadow(
                                  blurRadius: blur,
                                  offset: distance,
                                  color: Color.fromARGB(255, 201, 198, 198),
                                ),
                              ]),
                          child: SizedBox(
                            height: 62,
                            width: 160,
                            child: Txt(
                              "Message",
                              style: TxtStyle()
                                ..alignmentContent.center(true)
                                ..textColor(Colors.white)
                                ..fontWeight(FontWeight.bold)
                                ..fontSize(18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _getCategoryInfo(String title) {
  return Parent(
    style: ParentStyle()
      ..height(56)
      ..width(84)
      ..elevation(4, color: Colors.grey.withOpacity(0.5))
      ..margin(right: 32, left: 20)
      ..borderRadius(all: 10)
      ..background.color(Color.fromARGB(255, 147, 162, 182)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Txt(
          title,
          style: TxtStyle()
            ..fontSize(12)
            ..fontWeight(FontWeight.bold)
            ..textColor(Colors.white),
        ),
      ],
    ),
  );
}
