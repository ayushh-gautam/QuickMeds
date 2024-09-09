import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_profile_details_model.dart';

import '../../../api_collection/repo/http_api_method.dart';

class ProfileScreenController extends GetxController {
  var isLoading = false.obs;
  GetProfileDetailsModel getProfileDetailsModel = GetProfileDetailsModel();

  @override
  void onInit() {
    profileDetails();
    super.onInit();
  }

  Future<void> profileDetails() async {
    try {
      isLoading(true);
      var response = await AppHttpClient.get().httpGetMethod('/users.profile');

      getProfileDetailsModel = GetProfileDetailsModel.fromJson(response);
    } catch (e) {
      log("Error fetching profile details: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  void refreshProfile() {
    profileDetails();
  }
}
