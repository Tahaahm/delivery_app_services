// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/pages/body_page.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_sweet_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_popular.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> onRef() async {
    Get.find<PopularController>().getPopularProductList();
    Get.find<RecommendProductController>().getRecommendProduct();
    Get.find<DiscountController>().getDiscountProduct();
    Get.find<DesertSweetController>().getDesertProduct();
    Get.find<DesertController>().getDesertProduct();
    Get.find<MeatController>().getMeatProduct();
    Get.find<MeatPopularController>().getMeatProduct();
  }

  String username = "";
  String _image = "";

  Future<void> getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
      _image = (snap.data() as Map<String, dynamic>)['photoUrl'];
      // ignore: avoid_print
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      color: Colors.amber,
      onRefresh: onRef,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  BigText(
                    text: username == null ? "Hi" : "Hi,${username}",
                    color: Colors.black,
                  ),
                  _image != null
                      ? Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: AppColor.buttonColor,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(_image), fit: BoxFit.cover),
                          ),
                        )
                      : Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: AppColor.buttonColor,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                child: Column(
                  children: [
                    Text(
                      "We hope your in good mood",
                      style: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Divider(
                thickness: 0.4,
                color: Colors.grey,
              ),
              SizedBox(
                height: 35,
              ),
              BodyPage()
            ],
          ),
        ),
      ),
    ));
    // ignore: prefer_const_literals_to_create_immutables
  }
}
