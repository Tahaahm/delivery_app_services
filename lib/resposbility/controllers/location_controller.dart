// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, avoid_print, non_constant_identifier_names, unused_field, prefer_final_fields, recursive_getters, no_leading_underscores_for_local_identifiers, await_only_futures
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perfect_app_delivery/models/address_model.dart';
import 'package:perfect_app_delivery/resposbility/repo/location_repo.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _isLoading = false;
  bool get Loading => _isLoading;
  late Position _position;
  // Position get position=>_position;

  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;

  Placemark _pickplaceMark = Placemark();

  Placemark get pickplaceMark => _pickplaceMark;

  List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  List<AddressModel> get addressList => addressList;

  List<String> _addressTypeList = ['home', 'office', 'others'];
  int addressTypeIndex = 0;

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _isLoading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
              longitude: position.target.longitude,
              latitude: position.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
        if (_changeAddress) {
          String _address = await getAddressFromGeocode(
              LatLng(position.target.latitude, position.target.longitude));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknow Location Found";
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if (response.status == "OK") {
      _address = response.body['result'][0]['formatted_address'].toString();
    }
    return _address;
  }
}
