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
              print('hello World');
            },
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: const [
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
                ListTile(
                  title: Text('1번'),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
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
}
