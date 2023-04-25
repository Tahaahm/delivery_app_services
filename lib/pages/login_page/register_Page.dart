// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable, sized_box_for_whitespace, unused_local_variable, unused_element, prefer_const_constructors_in_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:perfect_app_delivery/resources/auth_method.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/utils/utils.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';
import 'package:perfect_app_delivery/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

Uint8List? _image;
bool _isLoading = false;

class _RegisterPageState extends State<RegisterPage> {
//https://assets3.lottiefiles.com/packages/lf20_qwsyhuhb.json
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordControler = TextEditingController();

  TextEditingController _usernameController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();
  void selectImage() async {
    Uint8List im = await imagePicker(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordControler.dispose();
    _usernameController.dispose();
    _phoneNumberController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_image != null) {
      String res = await AuthMethod().signUpUser(
        email: _emailController.text,
        password: _passwordControler.text,
        username: _usernameController.text,
        phone: _phoneNumberController.text,
        file: _image!,
      );
      if (res == 'success') {
        Get.snackbar(res, "Well done",
            backgroundColor: Colors.amber, colorText: Colors.white);
        Get.toNamed(RouterHelper.getIntroDetial());
      } else {
        Get.snackbar(res, "Error",
            colorText: Colors.white, backgroundColor: Colors.red);
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      Get.snackbar("Image Error", "Please Select Image",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  _image == null
                      ? Container(
                          height: 200,
                          child: LottieBuilder.asset(
                            "assets/images/5856-image-picture.json",
                            width: 240,
                          ),
                        )
                      : Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: MemoryImage(_image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: IconButton(
                      icon: _image != null
                          ? Icon(Icons.add_a_photo, color: Colors.white)
                          : Icon(Icons.add_a_photo),
                      onPressed: selectImage,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  BigText(
                    text: "Sign Up",
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  BigText(
                    text: "Welcome back! Let's start Eat",
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      controller: _usernameController,
                      hintText: "Username",
                      icon: Icons.person),
                  Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    icon: Icons.email,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: _passwordControler,
                    hintText: "Password",
                    icon: Icons.key,
                    obscuretext: true,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  CustomTextField(
                      controller: _phoneNumberController,
                      hintText: "phoneNumber",
                      icon: Icons.person),
                  Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      BigText(
                        text: "Do you have an account?",
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: BigText(
                          text: "Login ",
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => signUpUser(),
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Center(
                              child: BigText(
                                text: "Sign Up",
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
