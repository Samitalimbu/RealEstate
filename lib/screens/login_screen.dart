import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:division/division.dart';
import 'package:first/screens/bottom_screens/home_screens.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

import '../app/snackbar.dart';
import '../model/user.dart';
import '../repository/user_repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Notification code
  _checkNotificationsEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  int Counter = 1;

  @override
  void initState() {
    _checkNotificationsEnabled();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: "testUser");

  final _passwordController = TextEditingController(text: "password");
  _loginUser() async {
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin!) {
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushNamed(context, '/home');
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        "Email",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              String pattern =
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$";
                              RegExp regex = RegExp(pattern);
                              if (value.isEmpty || !regex.hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Email"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Txt(
                        "Password",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              if (value.length < 6) {
                                return 'Password length must be at least 6 characters';
                              }

                              return null;
                            },
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                          ),
                        ),
                      ),
                      const  SizedBox(height: 24),
                      ElevatedButton(
                        // key: const Key('btnLogin'),
                        child:  Text('Login'),
                        onPressed: () {
                          setState(() {
                            _loginUser();
                            Fluttertoast.showToast(
                                msg: 'you have login succesfully',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                backgroundColor: Colors.transparent,
                                textColor: Colors.amber);
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 82),
                        child: InkWell(
                          onTap: (() {
                            Navigator.popAndPushNamed(context, '/register');
                          }),
                          child: RichText(
                            text: const TextSpan(
                                text: "Forgot  password? ",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: "Click Here",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ]),
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
      ),
    );
  }
}
