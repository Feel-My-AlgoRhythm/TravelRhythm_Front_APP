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
  final api = Get.find<ApiFunction>(); //API

  Completer<NaverMapController> completer = Completer();
  MapType mapType = MapType.Basic;
  LocationTrackingMode trackingMode = LocationTrackingMode.Follow;
  RxList<Marker> markers = <Marker>[].obs; //마커 관리 리스트
  PlaceModel? placeModel;
  SolidController solidController = SolidController();

  List<int> bigCategoryIdList = [
    1
  ]; //toggle이 true인 상태 bigCategory들 ID 저장 ( 기본 1 )
  List<int> regionIdList = []; //검색에서 들어온 지역

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
  ]; //토글 버튼 관리
  RxList<bool> selectedCategorys = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs; //토글 관리

  bool isSearchMode = false; //검색 모드 분기용

  late Position position;
  late LatLng ownLocation; //현위치 가지고있는 변수

  var isLoading = true.obs;

  @override
  void onInit() async {
    position = await Geolocator.getCurrentPosition(); //현위치 정보
    ownLocation = LatLng(position.latitude, position.longitude); //현위치 좌표 저장
    setMarker(); // 첫 실행시 현위치 기반으로 마커 설정
    super.onInit();
  }

  ///실행시키면 bottomSheet 꺼짐
  void closeSheet() {
    solidController.hide();
  }

  ///naverMap 만들어졌을시 실행
  void onMapCreated(NaverMapController controller) async {
    if (completer.isCompleted) completer = Completer();
    completer.complete(controller);
    goToMyLocation();
    solidController.show();
  }

  ///현위치로 이동
  void goToMyLocation() async {
    final nmapController = await completer.future;
    nmapController.setLocationTrackingMode(LocationTrackingMode.Follow);
  }

  ///메인 화면에서 대분류 카테고리 탭했을 시 실행되는 함수
  ///들어온 데이터에 해당하는 마커를 clear 후 찍어줌
  onTapToggleButton(int index) async {
    for (int indexBtn = 0; indexBtn < selectedCategorys.length; indexBtn++) {
      if (indexBtn == index) {
        selectedCategorys[indexBtn] = !selectedCategorys[indexBtn];
        if (selectedCategorys[indexBtn]) {
          bigCategoryIdList.add(index + 1);
        } else {
          bigCategoryIdList.remove(index + 1);
        }
      }
    }
    setMarker();
  }

  ///마커 변경 함수 ( 검색 시나 위에 카테고리 토글을 클릭했을시 [Invoke] )
  ///
  ///[isSearchMode]로 검색 중인지 현위치 기반으로 탐색 중인지 조건을 분기하여 api 파라미터를 줌
  void setMarker() async {
    isLoading.value = true;
    //TODO changeToMylocationData [ownPosition]
    final Map<String, Object> data;

    //검색 조건 분기
    if (isSearchMode) {
      //검색 지역 기반
      data = {
        "bigCategoryIdList": bigCategoryIdList,
        "regionIdList": regionIdList,
      };
    } else {
      //현위치 기반
      data = {
        "bigCategoryIdList": bigCategoryIdList,
        "startX": 127.03516913869333,
        "startY": 37.54462268142329,
        "endX": 127.95917232009253,
        "endY": 37.546829241192285
      };
    }

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
    isLoading.value = false;
  }

  Widget setPlaceDataAtFeed() {
    return ListView(
        children: List.generate(placeModel!.content!.length, (index) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(RadiusSize.medium)),
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
              style:
                  const TextStyle(color: Colors.grey, fontSize: FontSize.large),
            ),
            Text(
              placeModel!.content![index].addressRoadName!,
              style:
                  const TextStyle(color: Colors.grey, fontSize: FontSize.small),
            ),
            const SizedBox(
              height: GapSize.xxLarge,
            )
          ],
        ),
      );
    }));
  }

  void onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    Get.toNamed(Routes.marker, arguments: {'position': marker?.position});
  }
}
