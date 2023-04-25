// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';

import 'package:perfect_app_delivery/constant/constant.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConst.CART_LIST);
    // sharedPreferences.remove(AppConst.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    // cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConst.CART_LIST, cart);
    print(sharedPreferences.getStringList(
      AppConst.CART_LIST,
    ));
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConst.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConst.CART_LIST)!;
    }

    List<CartModel> cartList = [];
    // carts.forEach((element) {
    //   return cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConst.CART_HISTORY_LIST)) {
      // cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConst.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) {
      cartHistoryList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartHistoryList;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConst.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConst.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      // print("history list" + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConst.CART_HISTORY_LIST, cartHistory);
    print("the length of history list is" +
        getCartHistoryList().length.toString());
    for (int i = 0; i < getCartHistoryList().length; i++) {
      print("the time for order is" + getCartHistoryList()[i].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConst.CART_LIST);
  }
}
