import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/module/marker_detail/marker_detail_controller.dart';

class MarkerDetail extends GetView<MarkerDetailController> {
  const MarkerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LatLng position = Get.arguments['position'];
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('${position.latitude} and ${position.longitude}'),
        ),
      ),
    );
  }
}
