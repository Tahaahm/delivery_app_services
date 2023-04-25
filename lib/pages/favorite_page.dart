// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class FavoriteFood extends StatefulWidget {
  const FavoriteFood({Key? key}) : super(key: key);

  @override
  State<FavoriteFood> createState() => _FavoriteFoodState();
}

class _FavoriteFoodState extends State<FavoriteFood> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                BigText(
                  text: "Favorite",
                  fontSize: 25,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 28,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: "My Favorite",
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Expanded(
                  flex: 1,
                  child: GetBuilder<RecommendProductController>(
                    builder: (controller) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(4, 4),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        color: Colors.grey.shade200)
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .recommendProduct[index]
                                                  .image!),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            gradient: LinearGradient(colors: [
                                              Colors.black45,
                                              Colors.black54
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 7),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: isFavorite
                                                        ? Center(
                                                            child: Image.asset(
                                                              "assets/icons/heart.png",
                                                              color:
                                                                  Colors.black,
                                                              width: 15,
                                                            ),
                                                          )
                                                        : Center(
                                                            child: Image.asset(
                                                              "assets/icons/heart (1).png",
                                                              width: 15,
                                                            ),
                                                          ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    BigText(
                                      text: controller
                                          .recommendProduct[index].name!,
                                      maxLine: 1,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        BigText(
                                          text: controller
                                                  .recommendProduct[index].time!
                                                  .toString() +
                                              "Mins",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: BigText(
                                            text: " . ",
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                        BigText(
                                          text: "Big",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        },
                        itemCount: controller.recommendProduct.length,
                      );
                    },
                  )),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      )),
    );
  }
}
