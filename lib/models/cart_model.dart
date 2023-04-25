// ignore_for_file: unnecessary_this

import 'package:perfect_app_delivery/models/product.dart';

class CartModel {
  int? id;
  String? name;
  double? price;
  String? image;
  int? quantity;
  String? time;
  bool? isExist;
  ProductsModel? product;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.isExist,
      this.quantity,
      this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = ProductsModel.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      'name': this.name,
      "price": this.price,
      "image": this.image,
      "quantity": this.quantity,
      'time': this.time,
      "isExist": this.isExist,
      "product": this.product!.toJson(),
    };
  }
}
