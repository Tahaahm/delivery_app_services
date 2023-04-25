import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:perfect_app_delivery/constant/constant.dart';

class DiscountRepo extends GetxService {
  final ApiClient apiClient;

  DiscountRepo({required this.apiClient});

  Future<Response> getDiscountProduct() async {
    return await apiClient.getData(AppConst.DISCOUNT_PRODUCT_URI);
  }
}
