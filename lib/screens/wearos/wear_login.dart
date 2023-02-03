import 'package:division/division.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/register_screen.dart';
import 'package:first/screens/wearos/wear_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wear/wear.dart';

import '../../app/snackbar.dart';
import '../../model/user.dart';
import '../../repository/user_repo.dart';

class WearLoginScreen extends StatefulWidget {
  const WearLoginScreen({super.key});

  @override
  State<WearLoginScreen> createState() => _WearLoginScreenState();
}

class _WearLoginScreenState extends State<WearLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  _login() async {
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin!) {
      // write here
      _goToAnotherPage();
    } else {
      _showMessage();
    }
    
    

    
   }
   _goToAnotherPage() {
    Navigator.pushNamed(context, '/dashboardscreen');
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Txt(
                                  "Login",
                                  style: TxtStyle()
                                    ..fontSize(18)
                                    ..padding(top: 8)
                                    ..fontWeight(FontWeight.bold)
                                    ..textColor(const Color(0xff557A95)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Txt(
                                "Email",
                                style: TxtStyle()
                                  ..fontSize(8)
                                  ..fontWeight(FontWeight.w500)
                                  ..fontFamily('Playfair_Display')
                                  ..textColor(Color.fromARGB(255, 57, 90, 114)),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
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
                                    if (value.isEmpty ||
                                        !regex.hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                  controller: _usernameController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.person),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Txt(
                                "Password",
                                style: TxtStyle()
                                  ..fontSize(8)
                                  ..fontWeight(FontWeight.w500)
                                  ..fontFamily('Playfair_Display')
                                  ..textColor(Color.fromARGB(255, 57, 90, 114)),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
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
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.password)),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 130,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xff7395AE))),
                                      child: const Text('Login'),
                                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WearDashboardScreen()));
                              }
                            
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
