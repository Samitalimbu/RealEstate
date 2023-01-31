import 'package:division/division.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/register_screen.dart';
import 'package:first/screens/wearos/wear_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wear/wear.dart';

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

  _loginUser() async {
    User? status = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    _showMessage(status!.userId);
  }

  _showMessage(int status) async {
    if (status > 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WearDashboardScreen()));
    } else {
      MotionToast.error(description: const Text('error login'));
    }
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
                                        _loginUser();
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
