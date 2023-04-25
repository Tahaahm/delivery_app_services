// ignore_for_file: avoid_print, unnecessary_import, prefer_final_fields, dead_code, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/resposbility/repo/popular_repo.dart';

class PopularController extends GetxController {
  final PopularProductRepo popularRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  PopularController({required this.popularRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];

      _popularProductList.addAll(Products.fromJson(response.body).product);
    }
    _isLoading = true;
    update();
  }

  void addQuantity(bool isIncremnet) {
    if (isIncremnet) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Item Count", "You can't reduce more!",
          colorText: Colors.white, backgroundColor: Colors.amber);
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      Get.snackbar("Item Count", "You can't add more!",
          colorText: Colors.white, backgroundColor: Colors.amber);
      return 20;
    } else {
      return quantity;
    }
  }

  void iniatlProduct(ProductsModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.exitInCart(product);
    if (exist) {
      _inCartItem = _cart.getQuantiy(product);
    }
  }

  void addItems(ProductsModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantiy(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItem;
  }
}
