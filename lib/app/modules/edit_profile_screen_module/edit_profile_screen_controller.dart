import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_profile_details_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/upload_file_model.dart';
import 'package:quickmeds_user/api_collection/repo/upload_file_repo.dart';

import '../../../api_collection/repo/http_api_method.dart';
import '../../routes/app_pages.dart';
import '../profile_screen_module/profile_screen_controller.dart';

class EditProfileScreenController extends GetxController {
  GetProfileDetailsModel getProfileDetailsModel = Get.arguments;

  TextEditingController userNameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  String imageUrl = "";
  String localImagePath = "";
  var localPicked = false.obs;
  var isLoading = false.obs;
  var isUploadedLoading = false.obs;

  @override
  void onInit() {
    userNameTextController.text = getProfileDetailsModel.user!.name!;
    phoneTextController.text = getProfileDetailsModel.user!.phone!;
    emailTextController.text = getProfileDetailsModel.user!.email!;
    imageUrl = getProfileDetailsModel.user!.avatar!;
    super.onInit();
  }

  Future<void> editProfileDetails(Map<String, dynamic> body) async {
    try {
      isLoading(true);
    
      var response =
          await AppHttpClient.get().httpPutMethod('/users.update', body);
      SuccessMessageModel successMessageModel = SuccessMessageModel.fromJson(response);
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.find<ProfileScreenController>().refreshProfile();
      Get.offNamed(Routes.PROFILE_SCREEN);
    } catch (e) {
      log("Error fetching profile details: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  // Upload image from local path
  Future<void> uploadFile() async{
     UploadFileRepo uploadFileRepo = UploadFileRepo();
    try {
      isUploadedLoading.value = true;
      UploadFileModel uploadFileModel = await uploadFileRepo.uploadFile(localImagePath);
      imageUrl = uploadFileModel.fileUrl!;

    } catch (e) {
      log("Error uploading image: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to upload image. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isUploadedLoading.value = false;
    }

  }
  

  @override
  void onClose() {
    userNameTextController.dispose();
    phoneTextController.dispose();
    emailTextController.dispose();
    super.onClose();
  }
}
