import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
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
        resizeToAvoidBottomInset: false,
        drawer: _buildDrawerListView(),
        appBar: AppBar(
          title: const Text("TravelRhythm"),
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
                  minZoom: 9,
                  logoClickEnabled: false,
                  markers: controller.markers.value,
                ),
                _buildBottomSheet(),
                _buildTopMenu(),
              ],
            )),
      ),
    );
  }

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

  _buildTopMenu() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: (Get.height - kToolbarHeight) * 0.2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 0), // changes position of shadow
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(RadiusSize.medium)),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(RadiusSize.large)),
                margin: const EdgeInsets.all(GapSize.medium),
                child: Material(
                  borderRadius: BorderRadius.circular(RadiusSize.large),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(RadiusSize.large)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(RadiusSize.large),
                      onTap: () {
                        Get.toNamed(Routes.search);
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: GapSize.small,
                              vertical: GapSize.small),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: GapSize.small),
                                child: Icon(
                                  Icons.search_rounded,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.only(
                                    bottom: GapSize.xxxSmall),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  )),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Where to go?',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: FontSize.large),
                                ),
                              )),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ButtonHeight.medium,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryButton(() {}, '카테고리 1'),
                    _buildCategoryButton(() {}, '카테고리 2'),
                    _buildCategoryButton(() {}, '카테고리 3'),
                    _buildCategoryButton(() {}, '카테고리 4'),
                    _buildCategoryButton(() {}, '카테고리 5'),
                    _buildCategoryButton(() {}, '카테고리 6'),
                    _buildCategoryButton(() {}, '카테고리 7'),
                    _buildCategoryButton(() {}, '카테고리 8'),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _buildCategoryButton(Function() onPressed, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GapSize.xxSmall),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(category),
      ),
    );
  }

  _buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SolidBottomSheet(
          maxHeight: (Get.height - kToolbarHeight) * 0.75,
          showOnAppear: false,
          controller: controller.solidController,
          draggableBody: true,
          headerBar: Container(
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0), // changes position of shadow
                )
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(RadiusSize.large)),
            ),
            child: const Center(child: Icon(Icons.maximize)),
          ),
          body: const Feed()),
    );
  }
}
