// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class DishesWidget extends StatelessWidget {
  const DishesWidget(
      {Key? key,
      required this.name,
      required this.imgPath,
      required this.descripions,
      required this.price})
      : super(key: key);
  final String name;
  final String descripions;
  final String imgPath;

  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      child: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 200,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BigText(
                  text: name,
                  maxLine: 1,
                  fontSize: 16,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                BigText(
                  text: descripions,
                  maxLine: 1,
                  fontSize: 12,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: BigText(
                        text: "\$",
                        color: AppColor.greyColor,
                        fontSize: 12,
                      ),
                    ),
                    BigText(
                      text: price.toString(),
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.shade100,
                  //       offset: Offset(1, 5),
                  //       blurRadius: 10,
                  //       spreadRadius: 10)
                  // ],
                  image: DecorationImage(
                    image: NetworkImage(imgPath),
                  )),
            ))
      ]),
    );
  }
}
