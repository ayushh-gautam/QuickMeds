import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/track_order_module/track_order_controller.dart';

class TrackOrderPage extends GetView<TrackOrderController> {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TrackOrder Page')),
      body: Container(
        child: Obx(() => Container(
              child: Text(controller.obj),
            )),
      ),
    );
  }
}
