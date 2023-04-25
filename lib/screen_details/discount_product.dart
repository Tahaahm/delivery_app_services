// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';
import 'package:perfect_app_delivery/widgets/text_explain.dart';

class DiscountPage extends StatefulWidget {
  DiscountPage(
      {Key? key, required this.pageId, required this.page, this.price = 0.0})
      : super(key: key);
  final int pageId;
  final String page;
  double price;
  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  List<IconData> icons = [
    Icons.brunch_dining_sharp,
    Icons.one_k,
    Icons.access_alarm
  ];
  List<String> text = ["Size", "Weight", "Time"];
  bool isFavorite = true;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<DiscountController>().discountProduct[widget.pageId];
    widget.price = (product.price - ((product.price / 100) * 10));

    Get.find<PopularController>()
        .iniatlProduct(product, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.yellow.shade100,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.page == "cartpage") {
                        Get.toNamed(RouterHelper.getCartPage());
                      } else {
                        Get.back();
                      }
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
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: isFavorite
                                ? Center(
                                    child: Image.asset(
                                      "assets/icons/heart.png",
                                      color: Colors.black,
                                      width: 25,
                                    ),
                                  )
                                : Center(
                                    child: Image.asset(
                                      "assets/icons/heart (1).png",
                                      width: 25,
                                    ),
                                  ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      GetBuilder<PopularController>(
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            Get.toNamed(RouterHelper.getCartPage());
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                  ),
                                ),
                                controller.totalItems >= 1
                                    ? Positioned(
                                        right: 4,
                                        top: 4,
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: BigText(
                                              text: controller.totalItems
                                                  .toString(),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ))
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/bg.png",
                      width: double.maxFinite,
                    ),
                    Image.network(
                      product.image!,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      height: 340,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                // title:
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12)),
                      child: BigText(
                        text: "15% OFF",
                        fontSize: 15,
                        color: Colors.blue[200]!,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BigText(
                      text: product.name!,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
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
                          text: widget.price.toStringAsFixed(2),
                          color: AppColor.greyColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextExpaling(
                      text: product.descriptions,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    text: text[0],
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  BigText(
                                    text: text[1],
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  BigText(
                                    text: text[2],
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        icons[0],
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      BigText(
                                        text: product.size!,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        icons[1],
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      BigText(
                                        text: "G " + product.weight,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        icons[2],
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      BigText(
                                        text: product.time.toString(),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularController>(
            builder: (controller) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 120,
                  width: double.maxFinite,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                color: Colors.grey.shade200,
                                width: 110,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.addQuantity(false);
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
                                                  BorderRadius.circular(9)),
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColor.buttonColor,
                                          ),
                                        ),
                                      ),
                                      BigText(
                                        text: controller.inCartItem.toString(),
                                        // controller.inCartItems.toString(),
                                        color: Colors.black,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.addQuantity(true);
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
                                                  BorderRadius.circular(9)),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColor.buttonColor,
                                          ),
                                        ),
                                      )
                                    ])),
                            SizedBox(
                              width: 70,
                            ),
                            InkWell(
                              onTap: () {
                                controller.addItems(product);
                              },
                              child: Container(
                                height: 65,
                                width: 180,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                      ),
                                      BigText(
                                        text: "Add to cart",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                )));
  }
}
