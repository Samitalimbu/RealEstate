import 'package:division/division.dart';
import 'package:first/model/user.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../repository/user_repo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  final _key = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  getUser() {
    UserRepositoryImpl().getUser().then((value) {
      print(value.isEmpty);
      for (var data in value) {
        print(data.userId);
        print(data.username);
      }
    });
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text('User added suceessfully'),
      ).show(context);
    } else {
      MotionToast.error(description: const Text('Error in adding user'))
          .show(context);
    }
  }

  _saveUser() async {
    User user = User(
      _usernameController.text,
      _passwordController.text,
      _confirmpasswordController.text,
    );

    print(user);
    int status = await UserRepositoryImpl().addUser(user);
    print(status);
    _showMessage(status);
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/login1.png",
                fit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 180, horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Txt(
                      "Login",
                      style: TxtStyle()
                        ..fontSize(30)
                        ..fontWeight(FontWeight.bold)
                        ..textColor(Colors.blue),
                    ),
                    const SizedBox(height: 18),
                    Txt(
                      "Username",
                      style: TxtStyle()
                        ..fontSize(16)
                        ..fontWeight(FontWeight.w500)
                        ..fontFamily('Playfair_Display')
                        ..textColor(Colors.blue),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Form(
                          key: _key,
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "username"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Txt(
                      "Password",
                      style: TxtStyle()
                        ..fontSize(16)
                        ..fontWeight(FontWeight.w500)
                        ..fontFamily('Playfair_Display')
                        ..textColor(Colors.blue),
                    ),
                    SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Txt(
                      "Confirm Password",
                      style: TxtStyle()
                        ..fontSize(16)
                        ..fontWeight(FontWeight.w500)
                        ..fontFamily('Playfair_Display')
                        ..textColor(Colors.blue),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          controller: _confirmpasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _saveUser();

                            // deleteUser();

                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Brand Bold",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.grey,
                                height: 36,
                                thickness: 2,
                              )),
                        ),
                        const Text(
                          "OR",
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: const Divider(
                                color: Colors.grey,
                                thickness: 2,
                                height: 36,
                              )),
                        ),
                      ]),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 127),
                        child: Row(
                          children: [
                            Image.asset("assets/images/facebook.png"),
                            const SizedBox(
                              width: 26,
                            ),
                            Image.asset("assets/images/search-2.png"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
