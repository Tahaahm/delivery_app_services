// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_sweet_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_popular.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  _loadResource() {
    Get.find<PopularController>().getPopularProductList();
    Get.find<RecommendProductController>().getRecommendProduct();
    Get.find<DesertController>().getDesertProduct();
    Get.find<DesertSweetController>().getDesertProduct();
    Get.find<DiscountController>().getDiscountProduct();
    Get.find<MeatController>().getMeatProduct();
    Get.find<MeatPopularController>().getMeatProduct();
  }

  @override
  void initState() {
    _loadResource();
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Get.offNamed(
        RouterHelper.getInit(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Lottie.asset(
          "assets/images/82624-foodies.json",
          animate: true,
          repeat: false,
        ),
      ),
    );
  }
}
