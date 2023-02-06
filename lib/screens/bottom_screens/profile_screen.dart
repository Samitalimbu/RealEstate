import 'package:first/screens/dashboard_screens.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardaScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(
                      "assets/images/profile1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 200, 15, 15),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 95),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        "Mosallas Group",
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text(
                                          "“Home is the starting place of love, hope and dreams.” “The magic thing about home is that it feels good to leave, and it feels even better to come back.",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        //You can add Subtitle here
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/profile1.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: const <Widget>[
                            ListTile(
                              title: Text("About Me"),
                            ),
                            Divider(),
                            ListTile(
                              title: Text("Email"),
                              subtitle: Text("MosallasDev@gmail.com"),
                              leading: Icon(Icons.email),
                            ),
                            ListTile(
                              title: Text("About"),
                              subtitle: Text(
                                  "We hope you find this channel useful.\nMosallas, is a group of 4 people who can do your projects well.\nAnd they will teach you their skills in this channel."),
                              leading: Icon(Icons.format_align_center),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
