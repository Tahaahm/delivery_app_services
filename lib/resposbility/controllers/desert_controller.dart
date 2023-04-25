// ignore_for_file: prefer_final_fields, avoid_print

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/desert_repo.dart';

class DesertController extends GetxController {
  final DesertRepo desertRepo;

  DesertController({required this.desertRepo});
  List<dynamic> _desertProduct = [];
  List<dynamic> get desertProduct => _desertProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getDesertProduct() async {
    Response response = await desertRepo.getDesertList();
    update();
    if (response.statusCode == 200) {
      print(_desertProduct);
      _desertProduct = [];

      _desertProduct.addAll(Products.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
