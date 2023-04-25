// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, unused_element, prefer_collection_literals, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/utils/dimentions.dart';
import 'package:perfect_app_delivery/utils/no_data.dart';
import 'package:perfect_app_delivery/utils/secon_colors.dart';
import 'package:perfect_app_delivery/widgets/app_icon.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    List<int> itemsOrder = cartItemsPerOrderToList();
    var listcounter = 0;
    Widget timeWidget(int index) {
      var outputData = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime praseData = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listcounter].time!);
        var inputData = DateTime.parse(praseData.toString());
        var outputForm = DateFormat("dd/MM/yyyy hh:mm a");
        outputData = outputForm.format(inputData);
      }
      return BigText(
        text: outputData,
        color: Colors.black,
        fontSize: 14,
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimentions.height50 * 2,
            color: Colors.amber,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimentions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  backgroundColor: Colors.amber,
                  iconColor: Colors.white,
                  sizeIcon: Dimentions.height10 * 2.5,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimentions.height20,
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: itemsOrder.length > 0
                      ? ListView(children: [
                          for (int i = 0; i < itemsOrder.length; i++)
                            Container(
                              height: Dimentions.height60 * 2,
                              margin:
                                  EdgeInsets.only(bottom: Dimentions.height20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  timeWidget(listcounter),
                                  SizedBox(
                                    height: Dimentions.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(itemsOrder[i],
                                            (index) {
                                          if (listcounter <
                                              getCartHistoryList.length) {
                                            listcounter++;
                                          }
                                          return index <= 2
                                              ? Container(
                                                  child: Container(
                                                  height:
                                                      Dimentions.height40 * 2,
                                                  width:
                                                      Dimentions.height40 * 2,
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimentions.width10 /
                                                              2),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimentions
                                                                  .height15 /
                                                              2),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            getCartHistoryList[
                                                                    listcounter -
                                                                        1]
                                                                .image
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ))
                                              : Container();
                                        }),
                                      ),
                                      Container(
                                        height: Dimentions.height40 * 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            BigText(
                                              text: "Total",
                                              color: AppColors.titleColors,
                                              fontSize: 12,
                                            ),
                                            BigText(
                                              text: itemsOrder[i].toString() +
                                                  " Items",
                                              color: AppColors.titleColors,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                var orderTime =
                                                    cartOrderTimeToList();
                                                Map<int, CartModel> moreOrder =
                                                    {};
                                                for (int j = 0;
                                                    j <
                                                        getCartHistoryList
                                                            .length;
                                                    j++) {
                                                  if (getCartHistoryList[j]
                                                          .time ==
                                                      orderTime[i]) {
                                                    moreOrder.putIfAbsent(
                                                        getCartHistoryList[j]
                                                            .id!,
                                                        () =>
                                                            CartModel.fromJson(
                                                              jsonDecode(
                                                                jsonEncode(
                                                                  getCartHistoryList[
                                                                      j],
                                                                ),
                                                              ),
                                                            ));
                                                  }
                                                  Get.toNamed(RouterHelper
                                                      .getCartPage());
                                                }
                                                Get.find<CartController>()
                                                    .setItems = moreOrder;
                                                Get.find<CartController>()
                                                    .addToCartList();
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Dimentions.width10,
                                                      vertical:
                                                          Dimentions.height10 /
                                                              2),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimentions
                                                                  .height15 /
                                                              3),
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.amber,
                                                      )),
                                                  child: BigText(
                                                    text: "one more",
                                                    color: Colors.amber,
                                                    fontSize: 14,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ])
                      : NoDataPage(
                          text: "You didn't buy anything so far!",
                          imgPath: "assets/images/empty_box.png",
                        )),
            ),
          )
        ],
      ),
    );
  }
}
