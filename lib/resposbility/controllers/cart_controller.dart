// ignore_for_file: curly_braces_in_flow_control_structures, unrelated_type_equality_checks, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];

  void addItem(ProductsModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity += value.quantity! + quantity;

        return CartModel(
          id: value.id,
          price: value.price,
          name: value.name,
          image: value.image,
          time: DateTime.now().toString(),
          isExist: true,
          quantity: value.quantity! + quantity,
          product: value.product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () => CartModel(
            id: product.id,
            price: product.price,
            image: product.image,
            name: product.name,
            time: DateTime.now().toString(),
            isExist: true,
            quantity: quantity,
            product: product,
          ),
        );
      } else {
        Get.snackbar("Item Count", "You should at least one item!",
            colorText: Colors.white, backgroundColor: Colors.amber);
      }
    }
    cartRepo.addToCartList(getItem);
    update();
  }

  bool exitInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantiy(ProductsModel product) {
    var _quantity = 0;
    if (_items.containsKey(product.id))
      _items.forEach((key, value) {
        if (key == product.id!) {
          _quantity = value.quantity!;
        }
      });

    return _quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItem {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addCartHistoryList() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItem);
    update();
  }

  double get getDiscount {
    var discount = 0.0;
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    if (total >= 40.0 && total < 50) {
      discount = (total / 100) * (10);
      total = total - discount;
    } else if (total > 20 && total < 40) {
      discount = (total / 100) * (5);
      total = total - discount;
    } else if (total >= 50) {
      discount = (total / 100) * (15);
      total = total - discount;
    }
    return total;
  }

  double get knowDiscount {
    var total = 0.0;
    var discount = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    if (total >= 40.0 && total < 50) {
      discount = (total / 100) * (10);
      total = total - discount;
    } else if (total > 20 && total < 40) {
      discount = (total / 100) * (5);
      total = total - discount;
    } else if (total >= 50) {
      discount = (total / 100) * (15);
      total = total - discount;
    }
    return discount;
  }
}


/* 
// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, prefer_final_fields

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];

  void addItem(ProductsModel product, int qunatity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      print(product.id.toString() + "the name " + product.name!);
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + qunatity;
        return CartModel(
          id: value.id,
          name: value.name,
          quantity: value.quantity! + qunatity,
          time: DateTime.now().toString(),
          isExist: true,
          image: value.image,
          price: value.price,
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (qunatity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            quantity: qunatity,
            time: DateTime.now().toString(),
            isExist: true,
            image: product.image,
            price: product.price,
            product: product,
          );
        });
      } else {
        Get.snackbar("item count", "You should at least add one item",
            colorText: Colors.white, backgroundColor: Colors.amber);
      }
    }
    cartRepo.addToCartList(getItem);
    update();
  }

  existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantiy(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItem {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  List<CartModel> get favorite {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get getDiscount {
    var discount = 0.0;
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    if (total >= 40.0 && total < 50) {
      discount = (total / 100) * (10);
      total = total - discount;
    } else if (total > 20 && total < 40) {
      discount = (total / 100) * (5);
      total = total - discount;
    } else if (total >= 50) {
      discount = (total / 100) * (15);
      total = total - discount;
    }
    return total;
  }

  double get knowDiscount {
    var total = 0.0;
    var discount = 0.0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    if (total >= 40.0 && total < 50) {
      discount = (total / 100) * (10);
      total = total - discount;
    } else if (total > 20 && total < 40) {
      discount = (total / 100) * (5);
      total = total - discount;
    } else if (total >= 50) {
      discount = (total / 100) * (15);
      total = total - discount;
    }
    return discount;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addCartHistoryList() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItem);
    update();
  }
}

*/