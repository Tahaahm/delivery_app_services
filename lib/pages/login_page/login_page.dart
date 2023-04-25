// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:perfect_app_delivery/pages/login_page/register_Page.dart';
import 'package:perfect_app_delivery/resources/auth_method.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//https://assets3.lottiefiles.com/packages/lf20_qwsyhuhb.json
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordControler = TextEditingController();

  List img = [
    "assets/images/f.png",
    "assets/images/g.png",
    "assets/images/t2.png"
  ];

  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().loginUser(
      email: _emailController.text,
      password: _passwordControler.text,
    );
    if (res == "success") {
      Get.toNamed(RouterHelper.init);
    } else {
      Get.snackbar(
        "Try Again",
        res,
        backgroundColor: Colors.amber,
        colorText: Colors.white,
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordControler.dispose();
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
              height: 55,
            ),
            Center(
              child: Container(
                height: 200,
                child: LottieBuilder.asset(
                  "assets/images/110295-login.json",
                  width: 280,
                ),
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
                    text: "Sign In",
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
                  TextField(
                    cursorColor: Colors.black,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: " Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    cursorColor: Colors.black,
                    controller: _passwordControler,
                    decoration: InputDecoration(
                      hintText: " Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.amber,
                      ),
                    ),
                  ),
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
                        text: "You don't have an account?",
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => RegisterPage()));
                        },
                        child: BigText(
                          text: "Create account",
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
                    onTap: () => loginUser(),
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: BigText(
                      text: "Or sign in with",
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => Image.asset(
                          img[index],
                          width: 32,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
