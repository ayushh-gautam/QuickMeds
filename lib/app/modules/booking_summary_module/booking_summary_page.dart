import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/booking_summary_module/booking_summary_controller.dart';

///
///

class BookingSummaryPage extends GetView<BookingSummaryController> {
  const BookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BookingSummary Page')),
      body: Container(
        child: Obx(() => Container(
              child: Text(controller.obj),
            )),
      ),
    );
  }
}
