import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';

import 'package:perfect_app_delivery/resposbility/repo/discount_repo.dart';

class DiscountController extends GetxController {
  final DiscountRepo discountRepo;
  DiscountController({required this.discountRepo});
  List<dynamic> _discountProduct = [];
  List<dynamic> get discountProduct => _discountProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getDiscountProduct() async {
    Response response = await discountRepo.getDiscountProduct();
    update();
    if (response.statusCode == 200) {
      _discountProduct = [];

      _discountProduct.addAll(Products.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
