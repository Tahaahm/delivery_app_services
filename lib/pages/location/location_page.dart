// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_new, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perfect_app_delivery/resposbility/controllers/location_controller.dart';

//AIzaSyBXDKEqonmmLEBKKYE5hAHYmHjnWXaRpNc
// ignore: use_key_in_widget_constructors
class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();

  CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(
        36.191113,
        44.009167,
      ),
      zoom: 17);
  late LatLng _initialPosition = LatLng(
    36.191113,
    44.009167,
  );
  // @override
  // void initState() {
  //   super.initState();
  //   if (Get.find<LocationController>().addressList.isNotEmpty) {
  //     _cameraPosition = CameraPosition(
  //         target: LatLng(
  //       Get.find<LocationController>().getAddress["latitude"],
  //       Get.find<LocationController>().getAddress["longitude"],
  //     ));
  //     _initialPosition = LatLng(
  //         Get.find<LocationController>().getAddress["latitude"],
  //         Get.find<LocationController>().getAddress["longitude"]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Address Page"),
        ),
        body: GetBuilder<LocationController>(
          builder: (locationController) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 17,
              ),
              zoomControlsEnabled: false,
              compassEnabled: false,
              indoorViewEnabled: true,
              mapToolbarEnabled: false,
              myLocationEnabled: true,
              onCameraIdle: () {
                locationController.updatePosition(_cameraPosition, true);
              },
              onCameraMove: (position) => _cameraPosition = position,
              onMapCreated: (GoogleMapController controller) {
                locationController.setMapController(controller);
              },
            );
          },
        ));
  }
}
