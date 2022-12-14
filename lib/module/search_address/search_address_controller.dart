import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/function/api_func.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

import '../../model/RegionModel.dart';

class SearchAddressController extends GetxController {
  final api = Get.find<ApiFunction>();
  final mapController = Get.find<NMapController>();

  var editAddress = TextEditingController();
  var editAddressFocus = FocusNode();

  late List<Content> regionList;
  RxList<String> regionNameList = [''].obs;

  RxString selectedRegion = ''.obs;

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

  Future<List<Content>?> getRegionList() async {
    final res = await api.dio.get('/regions', queryParameters: {"size": 25});
    RegionModel regionModel = RegionModel.fromJson(res.data);
    return regionModel.content;
  }

  search(int regionIndex, int bigCategoryIndex) async {
    final data = {"bigCategoryId": bigCategoryIndex, "regionId": regionIndex};
    final res = await api.dio.get('/places', queryParameters: data);
  }

  int getRegionIdWithString(String region) {
    return regionNameList.indexOf(region) + 1;
  }
}
