import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/function/api_func.dart';
import 'package:sw_travelrhythm/model/place_model.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

import '../../model/RegionModel.dart';

class SearchAddressController extends GetxController {
  final api = Get.find<ApiFunction>();
  final mapController = Get.find<NMapController>();

  var editAddress = TextEditingController();
  var editAddressFocus = FocusNode();

  late List<RegionContent> regionList;
  RxList<String> regionNameList = [''].obs;

  RxString selectedRegion = ''.obs;
  List<int> selectedBigCategoryId = [];

  final List<List<Widget>> categorys = [
    <Widget>[const Text('자연 관광'), const Text('역사 관광'), const Text('체험 관광')],
    <Widget>[const Text('문화 관광'), const Text('레저스포츠'), const Text('쇼핑')],
    <Widget>[const Text('음식'), const Text('숙박'), const Text('기타 관광')]
  ];

  List<RxList<bool>> selectedCategorys = [
    <bool>[false, false, false].obs,
    <bool>[false, false, false].obs,
    <bool>[false, false, false].obs
  ];

  @override
  void onInit() async {
    regionList = (await getRegionList())!;
    for (var element in regionList) {
      regionNameList.add(element.regionName!);
    }
    regionNameList.removeAt(0);
    selectedRegion.value = regionNameList.value[0];
    super.onInit();
  }

  bool addressValidator(String address) {
    return true;
  }

  void setSelectedRegion(String value) {
    selectedRegion.value = value;
  }

  Future<List<RegionContent>?> getRegionList() async {
    final res = await api.dio.get('/regions', queryParameters: {"size": 25});
    RegionModel regionModel = RegionModel.fromJson(res.data);
    return regionModel.regionContent;
  }

  search(List<int> regionIndex, List<int> bigCategoryIndex) async {
    final data = {
      "bigCategoryIdList": bigCategoryIndex,
      "regionIdList": regionIndex
    };
    final res = await api.dio.get('/places', queryParameters: data);
    Get.find<NMapController>().placeModel = PlaceModel.fromJson(res.data);
    Get.find<NMapController>().placeModel?.content?.forEach((content) {
      Get.find<NMapController>().markers.add(Marker(
            position: LatLng(content.y!, content.x!),
            markerId: content.id!.toString(),
            infoWindow: content.name,
          ));
    });
    Get.back();
  }

  List<int> getRegionIdWithString(String region) {
    List<int> regionIdList = [];
    regionIdList.add(regionNameList.indexOf(region) + 1);
    return regionIdList;
  }
}
