// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class TextExpaling extends StatefulWidget {
  TextExpaling({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<TextExpaling> createState() => _TextExpalingState();
}

class _TextExpalingState extends State<TextExpaling> {
  double height = 145;
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > height) {
      firstHalf = widget.text.substring(0, height.toInt());
      secondHalf =
          widget.text.substring(height.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;

      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? BigText(
                maxLine: 100,
                text: firstHalf,
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              )
            : Column(
                children: [
                  BigText(
                    maxLine: 100,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf),
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        BigText(
                          text: hiddenText ? "Show more" : "Show less",
                          fontSize: 14,
                          color: AppColor.buttonColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColor.buttonColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
