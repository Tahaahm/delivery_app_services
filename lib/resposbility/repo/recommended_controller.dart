import 'package:get/get.dart';
import 'package:perfect_app_delivery/constant/constant.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';

class RecommendProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendProductRepo({required this.apiClient});

  Future<Response> getRecommendProductList() async {
    return await apiClient.getData(AppConst.RECOMMEND_PRODUCT_URI);
  }
}
