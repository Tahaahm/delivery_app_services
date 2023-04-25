// ignore_for_file: prefer_final_fields, avoid_print

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/meat_repo.dart';

class MeatController extends GetxController {
  final MeatRepo meatRepo;

  MeatController({required this.meatRepo});
  List<dynamic> _meatProduct = [];
  List<dynamic> get meatProduct => _meatProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getMeatProduct() async {
    Response response = await meatRepo.getMeatList();
    update();
    if (response.statusCode == 200) {
      _meatProduct = [];

      _meatProduct.addAll(Products.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
