import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class TestRepo {
// !---------------Get Test Package--------------
  Future<GetTestPackagesModel> getTestPackages() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/testPackage.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getTestPackagesModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get test packages!');
  }

// !-----------------Get Test Packages By ID-----------------
  Future<GetTestPackagesByIdModel> getTestPackagesById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/testPackage/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getTestPackagesByIdModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get test packages by id!');
  }
}
