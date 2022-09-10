import 'dart:async';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:sw_travelrhythm/routes.dart';

class NMapController extends GetxController {
  Completer<NaverMapController> completer = Completer();
  MapType mapType = MapType.Basic;
  LocationTrackingMode trackingMode = LocationTrackingMode.Follow;
  RxList<Marker> markers = <Marker>[].obs;
  SolidController solidController = SolidController();
  late Position position;
  late LatLng ownLocation;
  @override
  void onInit() async {
    position = await Geolocator.getCurrentPosition();
    ownLocation = LatLng(position.latitude, position.longitude);
    markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: ownLocation,
        infoWindow: '테스트',
        onMarkerTab: onMarkerTap));
    super.onInit();
  }

  onMapTap(LatLng position) async {
    markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: position,
        infoWindow: '테스트',
        onMarkerTab: onMarkerTap));
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

/*  void goToSelectedLocation(LatLng position) async {
    final nmapController = await completer.future;

    markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: position,
        infoWindow: '테스트',
        onMarkerTab: onMarkerTap));
    final cameraPosition = CameraUpdate.scrollWithOptions(
        LatLng(position.latitude, position.longitude),
        zoom: 18);
    nmapController.moveCamera(cameraPosition);
  }*/

  void onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    Get.toNamed(Routes.marker, arguments: {'position': marker?.position});
  }
}
