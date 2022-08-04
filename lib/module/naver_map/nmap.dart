import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';

class NMap extends GetView<NMapController> {
  const NMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawerListView(),
        appBar: mainAppBar,
        body: NaverMap(
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
      ),
    );
  }

  Widget _buildDrawerListView(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          ListTile(
            title: Text("취향 검사 다시하기"),
          ),
          Divider(),
          ListTile(
            title: Text("Setting"),
          ),
          Divider(),
          ListTile(
            title: Text("위치 검색하기"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
