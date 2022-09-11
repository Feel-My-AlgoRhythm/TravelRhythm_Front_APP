import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/function/api_func.dart';
import 'package:sw_travelrhythm/module/analysis/analysis.dart';
import 'package:sw_travelrhythm/module/analysis/analysis_controller.dart';
import 'package:sw_travelrhythm/module/feed/feed_controller.dart';
import 'package:sw_travelrhythm/module/marker_detail/marker_detail.dart';
import 'package:sw_travelrhythm/module/marker_detail/marker_detail_controller.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap.dart';
import 'package:sw_travelrhythm/module/naver_map/nmap_controller.dart';
import 'package:sw_travelrhythm/module/search_address/search_address.dart';
import 'package:sw_travelrhythm/module/search_address/search_address_controller.dart';
import 'package:sw_travelrhythm/routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Get.putAsync(() => ApiFunction().init());
  FlutterNativeSplash.remove(); //로딩 끝나는 위치에 두어야 함(스플래시 제거)
  Geolocator.requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        //텍스트 크기 고정
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      //첫 라우팅 페이지
      initialRoute: Routes.analysis,
      getPages: [
        //페이지 추가
        GetPage(
            name: Routes.analysis,
            page: () => const Analysis(),
            binding: BindingsBuilder(
              () => {Get.put(AnalysisController())},
            )),
        GetPage(
            name: Routes.nmap,
            page: () => const NMap(),
            binding: BindingsBuilder(
              () => {Get.put(NMapController()), Get.put(FeedController())},
            )),
        GetPage(
            name: Routes.search,
            page: () => const SearchAddress(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
            binding: BindingsBuilder(
              () => {Get.put(SearchAddressController())},
            )),
        GetPage(
            name: Routes.marker,
            page: () => const MarkerDetail(),
            transition: Transition.zoom,
            transitionDuration: const Duration(milliseconds: 250),
            binding: BindingsBuilder(
              () => {Get.put(MarkerDetailController())},
            )),
      ],
    );
  }
}
