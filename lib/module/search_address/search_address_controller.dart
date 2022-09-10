import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

import '../../model/RegionModel.dart';

class SearchAddressController extends GetxController {
  final dio = Dio();
  final mapController = Get.find<NMapController>();

  var editAddress = TextEditingController();
  var editAddressFocus = FocusNode();

  late List<Content> regionList;
  RxList<String> regionNameList = [''].obs;

  RxString selectedRegion = ''.obs;

  final List<List<Widget>> categorys = [
    <Widget>[const Text('카테고리 1'), const Text('카테고리 2'), const Text('카테고리 3')],
    <Widget>[const Text('카테고리 4'), const Text('카테고리 5'), const Text('카테고리 6')],
    <Widget>[const Text('카테고리 7'), const Text('카테고리 8'), const Text('카테고리 9')]
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


  }


  bool addressValidator(String address) {

    return true;
  }

  void setSelectedRegion(String value) {
    selectedRegion!.value = value;
  }

  Future<List<Content>?> getRegionList() async {
    final res = await dio.get('http://54.180.128.143:8080/api/v1/regions', queryParameters: {"size": 25});
    RegionModel regionModel = RegionModel.fromJson(res.data);
    return regionModel.content;
  }

}
