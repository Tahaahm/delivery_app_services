// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class DesertWidget extends StatelessWidget {
  const DesertWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.desc,
      required this.star,
      required this.time,
      required this.freeDelivery})
      : super(key: key);
  final String image;
  final String name;
  final String desc;
  final String star;
  final String time;
  final String freeDelivery;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 285,
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          BigText(
            text: name,
            color: Colors.black,
            fontSize: 18,
          ),
          SizedBox(
            height: 2,
          ),
          BigText(
            text: desc,
            color: Colors.grey,
            fontSize: 13,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                child: Text(
                  star,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              BigText(
                text: "$time" + "min ",
                fontSize: 12,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: BigText(
                  text: " . ",
                  color: Colors.amber,
                ),
              ),
              BigText(
                text: freeDelivery,
                color: Colors.black,
                fontSize: 12,
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
