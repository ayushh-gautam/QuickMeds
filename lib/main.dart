import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/services/connectivity_check/network_controller.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';

import 'app/modules/z. my_app_module/my_app_page.dart';

void main() async {
  Get.put(NetworkController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyAppPage());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: appBgColor, // navigation bar color
    statusBarColor: appBgColor, // status bar color
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
