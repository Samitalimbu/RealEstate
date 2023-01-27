import 'package:division/division.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../model/user.dart';
import '../repository/user_repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  _loginUser() async {
    User? status = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    _showMessage(status!.userId);
  }

  _showMessage(int status) async {
    if (status > 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboardaScreen()));
    } else {
      MotionToast.error(description: const Text('error login'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
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
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 50,
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            child: const Text('Login'),
                            onPressed: () {
                              _loginUser();
                            },
                          ),
                        ),
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
