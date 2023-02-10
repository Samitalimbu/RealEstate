import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:division/division.dart';
import 'package:first/screens/bottom_screens/home_screens.dart';
import 'package:first/screens/dashboard_screens.dart';
import 'package:first/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../app/snackbar.dart';
import '../../repository/user_repo.dart';

class WearLoginScreen extends StatefulWidget {
  const WearLoginScreen({super.key});

  @override
  State<WearLoginScreen> createState() => _WearLoginScreenState();
}

class _WearLoginScreenState extends State<WearLoginScreen> {
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
    Navigator.pushNamed(context, '/weardashboard');
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    // final screen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Txt(
            "Email",
            style: TxtStyle()
              ..fontSize(16)
              ..fontWeight(FontWeight.w500)
              ..fontFamily('Playfair_Display')
              ..textColor(Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
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
          ),
          Txt(
            "Password",
            style: TxtStyle()
              ..fontSize(16)
              ..fontWeight(FontWeight.w500)
              ..fontFamily('Playfair_Display')
              ..textColor(Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
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
          ),
          ElevatedButton(
            // key: const Key('btnLogin'),
            child: Text('Login'),
            onPressed: () {
              setState(() {
                _loginUser();
              });
            },
          ),
        ]),
      )),
    ));
  }
}
