// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/location_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/utils/no_data.dart';
import 'package:perfect_app_delivery/utils/secon_colors.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Stack(children: [
          Positioned(
              left: 15,
              right: 15,
              top: 20,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    BigText(
                      text: "Your order",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouterHelper.getInit());
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          GetBuilder<CartController>(
            builder: (controller) => controller.getItem.length > 0
                ? Positioned(
                    left: 15,
                    right: 15,
                    top: 110,
                    bottom: 0,
                    child: Container(
                      child: ListView.builder(
                          itemCount: controller.getItem.length,
                          itemBuilder: (context, index) => Container(
                                height: 100,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularController>()
                                                .popularProductList
                                                .indexOf(controller
                                                    .getItem[index].product);

                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouterHelper.getpopularFood(
                                                  popularIndex, 'cartpage'));
                                        } else {
                                          var recommendIndex = Get.find<
                                                  RecommendProductController>()
                                              .recommendProduct
                                              .indexOf(controller
                                                  .getItem[index].product);

                                          if (recommendIndex < 0) {
                                            Get.snackbar("History Cart",
                                                "Product review is no available for history product",
                                                backgroundColor: Colors.amber,
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(
                                                RouterHelper.getrecommendFood(
                                                    recommendIndex,
                                                    'cartpage'));
                                          }
                                        }
                                      },
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: controller
                                                        .getItem[index].image !=
                                                    null
                                                ? DecorationImage(
                                                    image: NetworkImage(
                                                        controller
                                                            .getItem[index]
                                                            .image
                                                            .toString()),
                                                    fit: BoxFit.cover)
                                                : DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/dishes5.png"),
                                                    fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Container(
                                          height: 55,
                                          child: BigText(
                                            text:
                                                controller.getItem[index].name!,
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Container(
                                          width: 110,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.addItem(
                                                    controller.getItem[index]
                                                        .product!,
                                                    -1,
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 3,
                                                      right: 3,
                                                      top: 3,
                                                      bottom: 3),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColor.buttonColor,
                                                  ),
                                                ),
                                              ),
                                              BigText(
                                                text: controller
                                                    .getItem[index].quantity
                                                    .toString(),
                                                color: Colors.black,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.addItem(
                                                    controller.getItem[index]
                                                        .product!,
                                                    1,
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 3,
                                                      right: 3,
                                                      top: 3,
                                                      bottom: 3),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColor.buttonColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.delete_sweep_outlined,
                                            color: AppColor.greyColor,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 6),
                                              child: BigText(
                                                text: "\$",
                                                fontSize: 12,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                            BigText(
                                              text: controller
                                                  .getItem[index].price!
                                                  .toStringAsFixed(2)
                                                  .toString(),
                                              color: Colors.black,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                    ))
                : Center(
                    child: NoDataPage(text: "Your cart is empty"),
                  ),
          )
        ]),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (product) {
            return Container(
              height: 180,
              padding: EdgeInsets.only(left: 20, right: 20, top: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: product.getItem.length > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            BigText(
                              text: "Items",
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: BigText(
                                    text: "\$",
                                    fontSize: 9,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                BigText(
                                  text: product.totalAmount
                                      .toStringAsFixed(2)
                                      .toString(),
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            BigText(
                              text: "Discount",
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            Row(
                              children: [
                                BigText(
                                  text: "-",
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: BigText(
                                    text: "\$",
                                    fontSize: 9,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                BigText(
                                  text: product.knowDiscount
                                      .toStringAsFixed(2)
                                      .toString(),
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            BigText(
                              text: "Cost",
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: BigText(
                                    text: "\$",
                                    fontSize: 9,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                BigText(
                                  text: product.getDiscount
                                      .toStringAsFixed(2)
                                      .toString(),
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // product.addCartHistoryList();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                "Previous location?",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                // Get.back();
                                                // if (Get.find<
                                                //         LocationController>()
                                                //     .addressList
                                                //     .isEmpty) {
                                                Get.toNamed(
                                                    RouterHelper.localtionPage);
                                              },
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                product.addCartHistoryList();
                                                Get.back();
                                              },
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 280,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: BigText(
                                text: "Payment & Delivery",
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(),
            );
          },
        ));
  }
}
