import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../api_collection/api_models/send_login_details_model.dart';
import '../../../api_collection/api_models/success_message_model.dart';
import '../../../api_collection/config/api_config.dart';
import '../../../api_collection/config/shared_prefrences.dart';
import '../../routes/app_pages.dart';

class SignUpScreenController extends GetxController {
  final signUp = GlobalKey<FormState>();
  var isSignUpTapped = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  var isLoading = false.obs;

  Future actualSignUp(String url, dynamic body) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Authorization': MyApi.apiKey,
    };
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}$url'),
        headers: headers,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void signUpUsers() async {
    if (!signUp.currentState!.validate()) return;
    Map<String, dynamic> body = {
      "name": nameController.text,
      "countryCode": "+91",
      "phone": phoneController.text,
    };
    try {
      isLoading(true);
      var response = await actualSignUp('/users.reg', body);
      if (response != null) {
        SendLoginDetailsModel sendLoginDetailsModel =
            SendLoginDetailsModel.fromJson(response);
        String token = sendLoginDetailsModel.token!;
        PreferenceManager.get().setAccessToken(token);
        Get.toNamed(Routes.VERIFICATION_SCREEN,
            arguments: phoneController.text);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
