import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

class NMapController extends GetxController {
  Completer<NaverMapController> completer = Completer();
  MapType mapType = MapType.Basic;
  LocationTrackingMode trackingMode = LocationTrackingMode.Follow;

  @override
  void onInit() {
    super.onInit();
  }

  onMapTap(LatLng position) async {
    Get.showSnackbar(GetBar(
      duration: const Duration(milliseconds: 1500),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      title: '터치한 위치',
      message: '[onTap] lat: ${position.latitude}, lon: ${position.longitude}',
    ));
  }

  void onMapCreated(NaverMapController controller) {
    if (completer.isCompleted) completer = Completer();
    completer.complete(controller);
    goToMyLocation();
  }

  void goToMyLocation() async {
    final nmapController = await completer.future;
    nmapController.setLocationTrackingMode(LocationTrackingMode.Follow);
  }
}
