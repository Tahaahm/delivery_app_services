// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_sweet_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_popular.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';
import 'package:perfect_app_delivery/widgets/desert_widget.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final columnName = ["Popular", "Deserts", "Meat", "Food"];

  int current = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            BigText(
              text: "New Dishes",
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "42",
              style: TextStyle(
                  color: AppColor.buttonColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Expanded(child: Container()),
            Image.asset(
              "assets/images/menu-bar (1).png",
              scale: 2,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          child: ListView.builder(
            itemCount: columnName.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  current = index;
                });
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                margin: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                  color: current == index
                      ? Colors.grey.shade300
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    BigText(
                      text: columnName[index],
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.close,
                      color: Colors.white60,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        if (current == 0)
          //first index
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Offer ",
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<DiscountController>(
                  builder: (discount) => Container(
                        height: 200,
                        child: discount.isLoading
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: discount.discountProduct.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            RouterHelper.getDiscountPage(
                                                index, "discount-page"));
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 320,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  discount
                                                      .discountProduct[index]
                                                      .image!,
                                                ),
                                                fit: BoxFit.cover),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black38,
                                                Colors.black12
                                              ],
                                              end: Alignment.topLeft,
                                              begin: Alignment.bottomLeft,
                                            )),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black54,
                                                  Colors.black12
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BigText(
                                                  text: "Get Up To",
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                BigText(
                                                  text: "15% OFF ",
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                            : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              ),
                      )),
              SizedBox(
                height: 15,
              ),
              BigText(
                text: "Popular",
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<PopularController>(builder: (category) {
                return Container(
                  height: 350,
                  width: double.maxFinite,
                  child: category.isLoading
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.popularProductList.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouterHelper.getpopularFood(
                                        index, 'home'));
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height: 400,
                                      width: 240,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: NetworkImage(category
                                                  .popularProductList[index]
                                                  .image!),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black38,
                                                Colors.black12
                                              ],
                                              end: Alignment.topLeft,
                                              begin: Alignment.bottomLeft,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 100,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 15,
                                                          top: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BigText(
                                                        text: category
                                                            .popularProductList[
                                                                index]
                                                            .name!,
                                                        maxLine: 2,
                                                        fontSize: 15,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 6),
                                                            child: BigText(
                                                              text: "\$",
                                                              fontSize: 12,
                                                              color: AppColor
                                                                  .buttonColor,
                                                            ),
                                                          ),
                                                          BigText(
                                                            text: category
                                                                .popularProductList[
                                                                    index]
                                                                .price
                                                                .toString(),
                                                            color: AppColor
                                                                .buttonColor,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          BigText(
                                                            // ignore: prefer_interpolation_to_compose_strings
                                                            text: category
                                                                    .popularProductList[
                                                                        index]
                                                                    .time
                                                                    .toString() +
                                                                " Mins",
                                                            fontSize: 15,
                                                            color: AppColor
                                                                .greyColor,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            );
                          }))
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        ),
                );
              }),
              SizedBox(
                height: 20,
              ),
              BigText(
                text: "Recommended",
                color: Colors.black,
              ),
              SizedBox(
                height: 40,
              ),
              GetBuilder<RecommendProductController>(
                builder: (secondController) => Container(
                  height: 350,
                  width: double.maxFinite,
                  child: secondController.isLoading
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: secondController.recommendProduct.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouterHelper.getrecommendFood(
                                        index, 'reco'));
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height: 400,
                                      width: 240,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  secondController
                                                      .recommendProduct[index]
                                                      .image!),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black38,
                                              Colors.black12
                                            ],
                                            end: Alignment.topLeft,
                                            begin: Alignment.bottomLeft,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 100,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 15,
                                                          top: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BigText(
                                                        text: secondController
                                                            .recommendProduct[
                                                                index]
                                                            .name!,
                                                        maxLine: 2,
                                                        fontSize: 15,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 6),
                                                            child: BigText(
                                                              text: "\$",
                                                              fontSize: 12,
                                                              color: AppColor
                                                                  .buttonColor,
                                                            ),
                                                          ),
                                                          BigText(
                                                            text: secondController
                                                                .recommendProduct[
                                                                    index]
                                                                .price
                                                                .toString(),
                                                            color: AppColor
                                                                .buttonColor,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          BigText(
                                                            // ignore: prefer_interpolation_to_compose_strings
                                                            text: secondController
                                                                    .recommendProduct[
                                                                        index]
                                                                    .time
                                                                    .toString() +
                                                                " Mins",
                                                            fontSize: 15,
                                                            color: AppColor
                                                                .greyColor,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            );
                          }))
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          )
        else if (current == 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Popular",
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<DesertController>(
                builder: (controller) => Container(
                  height: 285,
                  child: controller.isLoading
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.desertProduct.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouterHelper.getpopularFood(
                                    index, "desert-popular"));
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: DesertWidget(
                                image: controller.desertProduct[index].image!,
                                name: controller.desertProduct[index].name!,
                                desc: controller
                                    .desertProduct[index].description!,
                                star: "4.5",
                                time: controller.desertProduct[index].time!
                                    .toString(),
                                freeDelivery: "FreeDelivery",
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BigText(
                text: "Recommended",
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<DesertSweetController>(
                  builder: (disSweet) => Container(
                        height: 285,
                        child: disSweet.isLoading
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: disSweet.desertProduct.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(RouterHelper.getrecommendFood(
                                          index, 'desert-popular'));
                                    },
                                    borderRadius: BorderRadius.circular(15),
                                    child: DesertWidget(
                                      image:
                                          disSweet.desertProduct[index].image!,
                                      name: disSweet.desertProduct[index].name!,
                                      desc: disSweet
                                          .desertProduct[index].description,
                                      star: "4.5",
                                      time: disSweet.desertProduct[index].time
                                          .toString(),
                                      freeDelivery: "FreeDelivery",
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    color: Colors.amber),
                              ),
                      ))
            ],
          )
        else if (current == 2)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Popular",
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<MeatPopularController>(
                builder: (controller) => Container(
                  height: 285,
                  child: controller.isLoading
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int i) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                    RouterHelper.getpopularFood(i, "meat"));
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: DesertWidget(
                                image: controller.meatProduct[i].image!,
                                name: controller.meatProduct[i].name!,
                                desc: controller.meatProduct[i].description!,
                                star: "3.8",
                                time:
                                    controller.meatProduct[i].time!.toString(),
                                freeDelivery: "FreeDelivery",
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BigText(
                text: "Recommended",
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<MeatController>(
                  builder: (meatController) => Container(
                        height: 285,
                        child: meatController.isLoading
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: meatController.meatProduct.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(RouterHelper.getrecommendFood(
                                          index, 'meat'));
                                    },
                                    borderRadius: BorderRadius.circular(15),
                                    child: DesertWidget(
                                      image: meatController
                                          .meatProduct[index].image!,
                                      name: meatController
                                          .meatProduct[index].name!,
                                      desc: meatController
                                          .meatProduct[index].description,
                                      star: "4.5",
                                      time: meatController
                                          .meatProduct[index].time
                                          .toString(),
                                      freeDelivery: "FreeDelivery",
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    color: Colors.amber),
                              ),
                      ))
            ],
          )
        else if (current == 3)
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Fourth",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
      ],
    );
  }
}
/*
 ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenDetials()));
                    },
                    child: DishesWidget(
                      name: "Mixican Potatoes",
                      imgPath: "assets/icons/fire.png",
                      likes: "4.62",
                      vote: "(322)",
                      times: "45 Min",
                      iconPath: 'assets/images/dishes8.png',
                    ),
                  ))
 */
