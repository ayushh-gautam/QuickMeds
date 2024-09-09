import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/repo/review_repo.dart';

import '../../../api_collection/api_models/success_message_model.dart';
import '../../services/get_ip_address.dart';

class RatingReviewScreenController extends GetxController {
  // !Add Product Id in argumets later on
  // int productId = Get.arguments;
  final ratingKey = GlobalKey<FormState>();
  double rating = 0.0;
  RxBool isLoading = false.obs;
  RxBool reviewSuccessFullyGiven = false.obs; // Make this reactive
  String ipAddress = '';
  int selectedRecommendation = -1;
  TextEditingController titleController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    fetchIPAddress();
    super.onInit();
  }

  setSelectedRecommendation(int value) {
    selectedRecommendation = value;
    update();
  }

  fetchIPAddress() async {
    ipAddress = await getUserIPAddress();
    log('User IP Address: $ipAddress');
  }

  Future<void> addReview(Map<String, dynamic> body) async {
    ReviewRepo reviewRepo = ReviewRepo();
    try {
      isLoading.value = true;
      SuccessMessageModel successMessageModel =
          await reviewRepo.sendReviewMethod(body);
      reviewSuccessFullyGiven.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Review added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending review: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to add review. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    reviewController.dispose();
    userNameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
