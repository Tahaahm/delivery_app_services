// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroDetail extends StatefulWidget {
  IntroDetail({Key? key}) : super(key: key);

  @override
  State<IntroDetail> createState() => _IntroDetailState();
}

class _IntroDetailState extends State<IntroDetail> {
  List<String> categories = [
    "assets/images/83548-online-shopping-black-friday.json",
    "assets/images/58915-online-shop.json",
    "assets/images/delivery_guy.json",
    "assets/images/pick_food_up.json",
    "assets/images/delivery.json",
  ];

  List<String> des = [
    "Let's go to buy a food",
    "you can check our website also",
    "There is a huge discounting",
    "hurry up there is a enough food that you want",
    "In short time we will catch the target",
  ];

  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Container(
            alignment: Alignment(0, 0.0002),
            child: Container(
              height: 370,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 4);
                  });
                },
                controller: _controller,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 240,
                        child: Lottie.asset(
                          categories[index],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 80,
                        child: BigText(
                          text: des[index],
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(4);
                      },
                      child: Text("Skip")),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: categories.length,
                    effect: WormEffect(
                      dotColor: Colors.white,
                      activeDotColor: Colors.orange[600]!,
                      dotWidth: 10,
                      dotHeight: 6,
                    ),
                  ),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(RouterHelper.getInit());
                          },
                          child: Text("Done"))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
