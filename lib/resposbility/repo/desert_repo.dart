import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:perfect_app_delivery/constant/constant.dart';

class DesertRepo extends GetxService {
  final ApiClient apiClient;

  DesertRepo({required this.apiClient});

  Future<Response> getDesertList() async {
    return await apiClient.getData(AppConst.DESERT_FOOD_URI);
  }
}
