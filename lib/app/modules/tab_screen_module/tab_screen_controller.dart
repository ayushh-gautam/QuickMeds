import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/cart_screen_module/cart_screen_page.dart';
import 'package:quickmeds_user/app/modules/category_screen_module/category_screen_page.dart';
import 'package:quickmeds_user/app/modules/lab_test_module/lab_test_page.dart';
import 'package:quickmeds_user/app/modules/upload_prescription_module/upload_prescription_page.dart';
import 'package:quickmeds_user/app/services/getcurrentlocation.dart';

import '../home_screen_module/home_screen_page.dart';

class TabScreenController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  int currentIndex = 0;
  List widgetOptions = <Widget>[
    HomeScreenPage(),
    CategoryScreenPage(),
    UploadPrescriptionPage(),
    LabTestPage(),
    CartScreenPage()
  ];
  var arg = Get.arguments;

  var currentCity = "";

  @override
  void onInit() {
    arg == true ? currentIndex = 3 : 0;
    arg == false ? currentIndex = 1 : 0;
    arg == "labTest" ? currentIndex = 3 : 0;
    fetchCurrentCity();
    super.onInit();
  }

  Future fetchCurrentCity() async {
    currentCity = await getCurrentLocation();
    update();
  }
}
