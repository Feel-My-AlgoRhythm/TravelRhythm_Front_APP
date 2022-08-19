import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/feed/feed_controller.dart';

class Feed extends GetView<FeedController> {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100),
          color: Colors.white,
          child: ListView(
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
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              controller.closeSheet();
            },
            child: const Text('Go To Map'),
          ),
        )
      ],
    );
  }
}
