import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/repo/ask_question_repo.dart';

class AskQuestionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool questionAddedSuccess = false.obs;

  TextEditingController questionController = TextEditingController();

  // !-----------Send Question Method-----------!
  Future<void> addAskQuestion(Map<String, dynamic> body) async {
    AskQuestionRepo askQuestionRepo = AskQuestionRepo();
    try {
      isLoading.value = true;
      SuccessMessageWithIdModel successMessageWithIdModel =
          await askQuestionRepo.sendQuestion(body);
      questionAddedSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageWithIdModel.message ?? 'Question Submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending question: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to add question. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }
}
