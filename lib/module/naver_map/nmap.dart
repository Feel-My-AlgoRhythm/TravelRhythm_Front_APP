import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

class NMap extends GetView<NMapController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NaverMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.566570, 126.978442),
          zoom: 17,
        ),
        onMapCreated: controller.onMapCreated,
        mapType: controller.mapType,
        initLocationTrackingMode: controller.trackingMode,
        locationButtonEnable: true,
        indoorEnable: true,
        onMapTap: controller.onMapTap,
        maxZoom: 20,
        minZoom: 5,
        logoClickEnabled: false,
      ),
    );
  }

}