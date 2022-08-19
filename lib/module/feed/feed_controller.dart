import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

class FeedController extends GetxController {
  final dio = Dio();
  final nmap = Get.find<NMapController>();

  @override
  void onInit() async {

  }

  void closeSheet() {
    nmap.solidController.hide();
  }

}
