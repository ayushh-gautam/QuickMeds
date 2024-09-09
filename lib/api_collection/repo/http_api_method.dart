import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../app/theme/app_colors.dart';
import '../api_models/success_message_model.dart';
import '../config/api_config.dart';

class AppHttpClient {
  AppHttpClient._();

  static AppHttpClient? _instance;

  static AppHttpClient get() {
    _instance ??= AppHttpClient._();
    return _instance!;
  }

// !---------Base Url---------
  final String _baseUrl = MyApi.baseUrl;

// !-------------Get Method-------------
  Future<Map<String, dynamic>> httpGetMethod(String url) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$url'),
        headers: {
          'accept': 'application/json',
          'X-Authorization': MyApi.apiKey,
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
          // "Authorization":
          //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
          // !Uncomment this line later on
        },
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
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
    throw Exception('Failed to get data!');
  }

// !-------------Post Method-------------
  Future httpPostMethod(String url, dynamic body) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Authorization': MyApi.apiKey,
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
      // "Authorization":
      //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
      // !Uncomment this line later on
    };
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$url'),
        headers: headers,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body as Map<String, dynamic>;
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
    throw Exception('Failed to post data!');
  }

// !-------------Put Method-------------
  Future httpPutMethod(String url, dynamic body) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl$url'),
        headers: {
          'accept': 'application/json',
          'X-Authorization': MyApi.apiKey,
          "Content-Type": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
          // "Authorization":
          //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
          // !Uncomment this line later on
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
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
    throw Exception('Failed to update data!');
  }

// !-------------Delete Method-------------
  Future httpDeleteMethod(String url) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl$url'),
        headers: {
          'accept': 'application/json',
          'X-Authorization': MyApi.apiKey,
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
          // "Authorization":
          //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
          // !Uncomment this line later on
        },
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body as Map<String, dynamic>;
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
    throw Exception('Failed to delete data!');
  }

  void toast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red : primaryGreenColor,
        textColor: Colors.white,
        fontSize: 12.sp);
  }
}
