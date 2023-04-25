// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/meat_popular_repo.dart';

class MeatPopularController extends GetxController {
  final MeatPopularRepo meatPopularRepo;

  MeatPopularController({required this.meatPopularRepo});
  List<dynamic> _meatProduct = [];
  List<dynamic> get meatProduct => _meatProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getMeatProduct() async {
    Response response = await meatPopularRepo.getMeatPopularList();
    update();
    if (response.statusCode == 200) {
      _meatProduct = [];

      _meatProduct.addAll(Products.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
