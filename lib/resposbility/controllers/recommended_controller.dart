import 'package:get/get.dart';
import 'package:perfect_app_delivery/models/product.dart';
import 'package:perfect_app_delivery/resposbility/repo/recommended_controller.dart';

class RecommendProductController extends GetxController {
  final RecommendProductRepo recommendProductRepo;

  RecommendProductController({required this.recommendProductRepo});
  List<dynamic> _recommendProduct = [];
  List<dynamic> get recommendProduct => _recommendProduct;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> getRecommendProduct() async {
    Response response = await recommendProductRepo.getRecommendProductList();
    update();
    if (response.statusCode == 200) {
      print(_recommendProduct);
      _recommendProduct = [];

      _recommendProduct.addAll(Products.fromJson(response.body).product);
      update();
      _isLoading = true;
    }
  }
}
