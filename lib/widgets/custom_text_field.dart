// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscuretext = false})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscuretext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      obscureText: obscuretext,
      controller: controller,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        hintText: hintText,
        // ignore: prefer_const_constructors
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        // ignore: prefer_const_constructors
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        // ignore: prefer_const_constructors
        prefixIcon: Icon(
          icon,
          color: Colors.amber,
        ),
      ),
    );
  }
}
