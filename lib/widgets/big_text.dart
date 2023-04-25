// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText(
      {Key? key,
      required this.text,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 22,
      this.color = Colors.white,
      this.maxLine = 1})
      : super(key: key);
  final String text;
  final TextOverflow textOverflow;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: textOverflow),
    );
  }
}
