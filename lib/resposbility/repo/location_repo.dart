// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perfect_app_delivery/constant/constant.dart';
import 'package:perfect_app_delivery/resposbility/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    return await apiClient.getData("${AppConst.GEOCODE_URL}"
        "?Lat=${latLng.latitude}&Lng${latLng.longitude}");
  }
}
