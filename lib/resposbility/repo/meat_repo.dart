import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:perfect_app_delivery/constant/constant.dart';

class MeatRepo extends GetxService {
  final ApiClient apiClient;

  MeatRepo({required this.apiClient});

  Future<Response> getMeatList() async {
    return await apiClient.getData(AppConst.MEAT_URL);
  }
}
