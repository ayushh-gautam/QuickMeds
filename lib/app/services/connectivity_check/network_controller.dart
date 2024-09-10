import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(connectivityStatus);
  }

  connectivityStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
          title: 'No Internet',
          message: 'Connect to internet',
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.grey,
          ),
          duration: const Duration(days: 1),
          shouldIconPulse: true);
    } else if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
  }
}
