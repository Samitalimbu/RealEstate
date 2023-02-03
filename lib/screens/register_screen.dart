import 'dart:io';

import 'package:first/app/user_permission.dart';
import 'package:first/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

import '../model/user.dart';

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
    checkPermission();
  }

  checkPermission() async {
    await UserPermission.checkCameraPermission();
  }

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: "testUser");
  final _lnameController = TextEditingController(text: "testUser");
  final _usernameController = TextEditingController(text: "testUser1");
  final _passwordController = TextEditingController(text: "password");
  getUser() {
    UserRepositoryImpl().getUser().then((value) {
      print(value.isEmpty);
      for (var data in value) {
        print(data.userId);
        print(data.fname);
      }
    });
  }

  // deleteUser(){
  //   int status=UserRepositoryImpl().deleteUser();
  //   _showMessage(status);
  // }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text('Student added suceessfully'),
      ).show(context);
    } else {
      MotionToast.error(description: const Text('Error in adding student'))
          .show(context);
    }
  }

  _saveUser() async {
    User user = User(
      fname: _fnameController.text,
      lname: _lnameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
    print(user);
    int status = await UserRepositoryImpl().addUser(img, user);
    print(status);
    _showMessage(status);
  }

  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login1.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _loadImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera),
                                    label: const Text('Camera'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _loadImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text('Gallery'),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 200,
                          width: double.infinity - 500,
                          child: img == null
                              ? SvgPicture.asset(
                                  'assets/svg/profile.svg',
                                )
                              : Image.file(img!),
                        ),
                      ),

                      TextFormField(
                        controller: _fnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'First Name',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _lnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Last Name',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //     FutureBuilder(
                      //   future: GenderRespositoryImpl().getAllGender(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return DropdownButtonFormField(
                      //         validator: (value) {
                      //           if (value == null) {
                      //
                      // return 'Please select gender';
                      //           }
                      //           return null;
                      //         },
                      //         isExpanded: true,
                      //         decoration: const InputDecoration(
                      //           border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      //           labelText: 'Select gender',
                      //         ),
                      //         items: snapshot.data!
                      //             .map(
                      //               (gender) => DropdownMenuItem(
                      //                 value: gender,
                      //                 child: Text(gender.genderName),
                      //               ),
                      //             )
                      //             .toList(),
                      //         onChanged: (value) {
                      //           _dropDownValue = value!;
                      //         },
                      //       );
                      //     } else {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // ),

                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Username',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Password',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
                      InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/login1');
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
