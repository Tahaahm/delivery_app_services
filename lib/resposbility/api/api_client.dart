// ignore_for_file: prefer_const_constructors, unused_field

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    token = "";
    timeout = Duration(seconds: 30);
    _mainHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearar $token'
    };
  }
  Future<Response> getData(
    String url,
  ) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
