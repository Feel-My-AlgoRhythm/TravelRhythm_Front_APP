import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/feed/feed_controller.dart';

class Feed extends GetView<FeedController> {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: GapSize.medium),
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
          borderRadius: BorderRadius.circular(RadiusSize.medium)),
      child: ListView(
        children: [
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
    );
  }
}
