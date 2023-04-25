// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/desert_sweet_repo.dart';

class DesertSweetController extends GetxController {
  final DesertSweetRepo desertSweetRepo;

  DesertSweetController({required this.desertSweetRepo});
  List<dynamic> _desertProduct = [];
  List<dynamic> get desertProduct => _desertProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getDesertProduct() async {
    Response response = await desertSweetRepo.getDesertList();
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
