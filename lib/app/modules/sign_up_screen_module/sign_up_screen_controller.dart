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

  // API call  within the controller
  Future<dynamic> actualSignUp(String url, dynamic body) async {
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

      // Logging for debugging purposes
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        
        final successMessageModel = successMessageModelFromJson(response.body); 
        Get.snackbar(
          "Error",
          successMessageModel.message ?? "An unexpected error occurred.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  void signUpUsers() async {
    if (!signUp.currentState!.validate()) return;

    // Creating request body
    Map<String, dynamic> body = {
      "name": nameController.text,
      "countryCode": "+91", 
      "phone": phoneController.text,
    };

    try {
      isLoading(true); 
      var response = await actualSignUp('/users.reg', body); // API endpoint

      if (response != null) {
      
        SendLoginDetailsModel sendLoginDetailsModel =
            SendLoginDetailsModel.fromJson(response);
        
        // Storing token in preferences
        String token = sendLoginDetailsModel.token!;
        PreferenceManager.get().setAccessToken(token);
        Get.toNamed(Routes.VERIFICATION_SCREEN, arguments: phoneController.text);
      }
    } catch (e) {
      log('Error during sign-up: $e');
    } finally {
      isLoading(false); 
    }
  }

  // clean up the controllers when the screen is disposed of
  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    super.onClose();
  }
}