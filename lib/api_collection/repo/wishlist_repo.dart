import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_wishlist_details_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class WishlistRepo {
  // !-----------------Toggle Wishlist-----------------
  Future<SuccessMessageModel> toggleWishList(dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}/wishlist.toggle'),
        headers: MyApi.postHeaders,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return successMessageModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on SocketException catch (e) {
      Get.snackbar("Error", 'Error", "No Internet Connection.',
          snackPosition: SnackPosition.BOTTOM);
      log("SocketException: ${e.toString()}");
    } catch (e) {
      log("API ko Error: ${e.toString()}");
    }
    throw Exception('Failed to toggle wishlist!');
  }

  // !-----------------Get Wishlist-----------------
  Future<GetWishListDetailsModel> getWishList() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/wishlist.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getWishListDetailsModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } on SocketException catch (e) {
      Get.snackbar("Error", 'Error", "No Internet Connection.',
          snackPosition: SnackPosition.BOTTOM);
      log("SocketException: ${e.toString()}");
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get wishlist data!');
  }
}
