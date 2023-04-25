import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:perfect_app_delivery/constant/constant.dart';

class MeatPopularRepo extends GetxService {
  final ApiClient apiClient;

  MeatPopularRepo({required this.apiClient});

  Future<Response> getMeatPopularList() async {
    return await apiClient.getData(AppConst.MEAT_URL_POPULAR);
  }
}
