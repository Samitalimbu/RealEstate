import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            children: [
              buildPage(
                  title: "Welcome to Real estate ",
                  desc:
                      "Nepal's free online platform for buying and selling house",
                  image: "assets/images/t.png"),
              buildPage(
                  title: "For you safety",
                  desc:
                      "We are dedicated to making the search for a great home or a perfect plot of land for Nepali people as simple and uncomplicated as it has never been.",
                  image: "assets/images/splash2.png"),
              buildPage(
                  title: "Connect Each Other",
                  desc:
                      "We bring property buyers and sellers together on one platform.",
                  image: "assets/images/t.png"),
              buildPage(
                  title: "Find your home",
                  desc:
                      "Helps in the search for a desired residence, rental service, or property leasing service.",
                  image: "assets/images/splash2.png"),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.blue,
                      minimumSize: const Size.fromHeight(60)),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, "/loginscreen");
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool("isWalkthroughShown", true);
                  },
                ),
              )
            : Container(
                height: 80,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(3);
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: WormEffect(
                            spacing: 16,
                            dotColor: Colors.grey.shade300,
                            activeDotColor: Colors.blue),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: const Text("NEXT")),
                  ],
                ),
              ),
      ),
    );
  }
}

Widget buildPage({
  required String title,
  required String desc,
  required String image,
}) =>
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.asset(
            image,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              desc,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
