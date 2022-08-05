import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/model/search_address_model.dart';

class SearchAddressController extends GetxController {
  final dio = Dio();

  SearchAddressModel? searchAddressModel;
  var addressData = <Juso>[].obs;

  var editAddress = TextEditingController();
  var editAddressFocus = FocusNode();

  @override
  void onInit() async {
    editAddress.addListener(addressListener);
  }

  void addressListener() async {
    if (addressValidator(editAddress.text)) {
      await getSearchAddressData(editAddress.text);
    }
  }

  Future<void> getSearchAddressData(String keyword) async {
    final data = {
      "confmKey": "devU01TX0FVVEgyMDIyMDgwNTEzMTMxMTExMjg1NDM=",
      "currentPage": 1,
      "countPerPage": 40,
      "keyword": keyword,
      "resultType": "json",
    };

    final res = await dio.post("http://www.juso.go.kr/addrlink/addrLinkApi.do",
        queryParameters: data);

    if (res.data['results']['common']['errorCode'] == "0") {
      searchAddressModel = SearchAddressModel.fromJson(res.data);
    } else {
      return;
    }

    final List<dynamic>? jusoDataList =
        searchAddressModel?.results?.toJson()['juso'];

    if (jusoDataList != null) {
      if (jusoDataList.isNotEmpty) {
        addressData.value =
            jusoDataList.map((map) => Juso.fromJson(map)).toList();
      }
    }
  }

  bool addressValidator(String address) {
    final validationList = [
      "OR",
      "SELECT",
      "INSERT",
      "DELETE",
      "UPDATE",
      "CREATE",
      "DROP",
      "EXEC",
      "UNION",
      "FETCH",
      "DECLARE",
      "TRUNCATE"
    ];

    if (address.length < 2) {
      return false;
    }
    if (address.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }
    for (var val in validationList) {
      if (address.contains(val)) {
        return false;
      }
    }

    return true;
  }
}
