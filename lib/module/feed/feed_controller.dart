import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

class FeedController extends GetxController {
  final nmap = Get.find<NMapController>();

  @override
  void onInit() async {

  }

  void closeSheet() {
    nmap.solidController.hide();
  }

  List<Widget> setPlaceDataAtFeed() {
    return List.generate(nmap.placeModel!.content!.length, (index){
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(RadiusSize.medium)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/logo/splash_logo.png',
              width: WidthWithRatio.xxxLarge,
              height: WidthWithRatio.xxxLarge,
            ),
            const SizedBox(
              height: GapSize.medium,
            ),
            Text(
              nmap.placeModel!.content![index].name!,
              style: TextStyle(color: Colors.grey, fontSize: FontSize.large),
            ),
            Text(
              nmap.placeModel!.content![index].addressRoadName!,
              style: TextStyle(color: Colors.grey, fontSize: FontSize.small),
            ),
            const SizedBox(
              height: GapSize.xxLarge,
            )
          ],
        ),
      );
    });
  }
}
