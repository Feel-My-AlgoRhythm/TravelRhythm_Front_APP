import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/feed/feed.dart';
import 'package:sw_travelrhythm/module/feed/feed_controller.dart';
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SolidBottomSheet(
                      maxHeight: (MediaQuery.of(context).size.height -
                              kToolbarHeight) *
                          0.75,
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
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(RadiusSize.large)),
                        ),
                        child: const Center(
                          child: Icon(Icons.maximize)
                        ),
                      ),
                      body: Feed()),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: (MediaQuery.of(context).size.height -
                          kToolbarHeight) *
                          0.2,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(RadiusSize.medium)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(RadiusSize.small)),
                            margin: const EdgeInsets.all(GapSize.medium),
                            child: const Padding(
                              padding: EdgeInsets.all(GapSize.xSmall),
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Search'),
                              ),
                            ),
                          ),
                          Container(
                            height: ButtonHeight.xxxLarge,
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
                    )),
              ],
            )),
      ),
    );
  }

  Widget _buildCategoryButton(Function() onPressed, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GapSize.xxSmall),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(category),
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
}
