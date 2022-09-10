import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/module/feed/feed_controller.dart';

class Feed extends GetView<FeedController> {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: GapSize.medium),
          color: Colors.white,
          child: RefreshIndicator(
            onRefresh: () async {
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
                _buildFeedListTile(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(GapSize.medium),
            child: FloatingActionButton(
              onPressed: () {
                controller.closeSheet();
              },
              child: const Icon(Icons.arrow_circle_down),
            ),
          ),
        ),
      ],
    );
  }

  _buildFeedListTile() {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'asset/image/logo/splash_logo.png'
              ),
              const SizedBox(
                height: GapSize.medium,
              ),
              const Text('장소 이름', style: TextStyle(color: Colors.grey, fontSize: FontSize.large),),
              const Text('장소 설명', style: TextStyle(color: Colors.grey, fontSize: FontSize.small),),
              SizedBox(
                height: GapSize.xxLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
