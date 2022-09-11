import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/function/api_func.dart';
import 'package:sw_travelrhythm/model/place_model.dart';
import 'package:sw_travelrhythm/routes.dart';

class NMapController extends GetxController {
  final api = Get.find<ApiFunction>();

  Completer<NaverMapController> completer = Completer();
  MapType mapType = MapType.Basic;
  LocationTrackingMode trackingMode = LocationTrackingMode.Follow;
  RxList<Marker> markers = <Marker>[].obs;
  SolidController solidController = SolidController();
  List<int> bigCategoryIdList = [1];
  PlaceModel? placeModel;

  final List<Widget> categorys = [
    const Text('자연 관광'),
    const Text('역사 관광'),
    const Text('체험 관광'),
    const Text('문화 관광'),
    const Text('레저스포츠'),
    const Text('쇼핑'),
    const Text('음식'),
    const Text('숙박'),
    const Text('기타 관광')
  ];

  RxList<bool> selectedCategorys =
      <bool>[true, false, false, false, false, false, false, false, false].obs;

  late Position position;
  late LatLng ownLocation;

  @override
  void onInit() async {
    position = await Geolocator.getCurrentPosition();
    ownLocation = LatLng(position.latitude, position.longitude);
    setMarkerWithMyLocation();
    super.onInit();
  }

  void closeSheet() {
    solidController.hide();
  }

  void onMapCreated(NaverMapController controller) async {
    if (completer.isCompleted) completer = Completer();
    completer.complete(controller);
    goToMyLocation();
    solidController.show();
  }

  void goToMyLocation() async {
    final nmapController = await completer.future;
    nmapController.setLocationTrackingMode(LocationTrackingMode.Follow);
  }

  onTapToggleButton(int index) async {
    for (int indexBtn = 0; indexBtn < selectedCategorys.length; indexBtn++) {
      if (indexBtn == index) {
        selectedCategorys[indexBtn] = !selectedCategorys[indexBtn];
        if (selectedCategorys[indexBtn]) {
          bigCategoryIdList.add(index + 1);
        } else {
          bigCategoryIdList.remove(index + 1);
        }
        final data = {
          "bigCategoryIdList": bigCategoryIdList,

        };
        final res = await api.dio.get('/places', queryParameters: data);
        placeModel = PlaceModel.fromJson(res.data);
        markers.clear();
        placeModel?.content?.forEach((content) {
          markers.add(Marker(
            position: LatLng(content.y!, content.x!),
            markerId: content.id!.toString(),
            infoWindow: content.name,
          ));
        });
      }
    }
  }

  void setMarkerWithMyLocation() async {
    //TODO changeToMylocationData [ownPosition]
    final data = {
      "bigCategoryIdList": bigCategoryIdList,
      "startX": 127.03516913869333,
      "startY": 37.54462268142329,
      "endX": 127.95917232009253,
      "endY": 37.546829241192285
    };
    final res = await api.dio.get('/places', queryParameters: data);
    placeModel = PlaceModel.fromJson(res.data);

    markers.clear();

    placeModel?.content?.forEach((content) {
      markers.add(Marker(
        position: LatLng(content.y!, content.x!),
        markerId: content.id!.toString(),
        infoWindow: content.name,
      ));
    });
  }

  List<Widget> setPlaceDataAtFeed() {
    return List.generate(placeModel!.content!.length, (index){
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
              placeModel!.content![index].name!,
              style: const TextStyle(color: Colors.grey, fontSize: FontSize.large),
            ),
            Text(
              placeModel!.content![index].addressRoadName!,
              style: const TextStyle(color: Colors.grey, fontSize: FontSize.small),
            ),
            const SizedBox(
              height: GapSize.xxLarge,
            )
          ],
        ),
      );
    });
  }


  void onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    Get.toNamed(Routes.marker, arguments: {'position': marker?.position});
  }

}
