import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:perfect_app_delivery/constant/constant.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_sweet_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/location_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_popular.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';

import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/resposbility/repo/cart_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/desert_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/desert_sweet_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/discount_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/location_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/meat_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/meat_popular_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/popular_repo.dart';
import 'package:perfect_app_delivery/resposbility/repo/recommended_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConst.BASE_URL));
//CONTROLLER
  Get.lazyPut(() => PopularController(popularRepo: Get.find()));
  Get.lazyPut(
      () => RecommendProductController(recommendProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => DesertRepo(apiClient: Get.find()));
  Get.lazyPut(() => DiscountController(discountRepo: Get.find()));
  Get.lazyPut(() => DesertSweetController(desertSweetRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => MeatController(meatRepo: Get.find()));
  Get.lazyPut(() => MeatPopularController(meatPopularRepo: Get.find()));
//REPO
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => DesertController(desertRepo: Get.find()));
  Get.lazyPut(() => DiscountRepo(apiClient: Get.find()));
  Get.lazyPut(() => DesertSweetRepo(apiClient: Get.find()));
  Get.lazyPut(() => MeatRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationRepo(
      apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => MeatPopularRepo(apiClient: Get.find()));
}
