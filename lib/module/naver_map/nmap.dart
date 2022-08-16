import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/feed/feed.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';
import 'package:sw_travelrhythm/routes.dart';

class NMap extends GetView<NMapController> {
  const NMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawerListView(),
        appBar: AppBar(
          title: const Text("TravelRhythm"),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.search);
              },
              icon: const Icon(Icons.search_rounded),
            )
          ],
        ),
        body: Obx(() => Stack(
              children: [
                NaverMap(
                  onMapCreated: controller.onMapCreated,
                  mapType: controller.mapType,
                  initLocationTrackingMode: controller.trackingMode,
                  locationButtonEnable: true,
                  indoorEnable: true,
                  onMapTap: controller.onMapTap,
                  maxZoom: 20,
                  minZoom: 5,
                  logoClickEnabled: false,
                  markers: controller.markers.value,
                ),
                Container(
                  height: MediaQuery.of(context).size.height /3,
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        TextField(),
                        Row(
                          children: [
                            Expanded(child: Text('카테고리 1')),
                            Expanded(child: Text('카테고리 2')),
                            Expanded(child: Text('카테고리 3')),
                            Expanded(child: Text('카테고리 4')),
                          ],
                        )
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Go to Map')),
                )
              ],
            )),
      ),
    );
  }

/*  NaverMap(
  onMapCreated: controller.onMapCreated,
  mapType: controller.mapType,
  initLocationTrackingMode: controller.trackingMode,
  locationButtonEnable: true,
  indoorEnable: true,
  onMapTap: controller.onMapTap,
  maxZoom: 20,
  minZoom: 5,
  logoClickEnabled: false,
  markers: controller.markers.value,
  )*/
  Widget _buildDrawerListView() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: GapSize.xxLarge),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              height: GapSize.medium,
            ),
            ListTile(
              title: Text(
                "취향 검사 다시하기",
                style: drawerListTextStyle,
              ),
              leading: Icon(Icons.replay_rounded),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Setting",
                style: drawerListTextStyle,
              ),
              leading: Icon(Icons.settings_rounded),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
