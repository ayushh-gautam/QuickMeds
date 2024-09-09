import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_wishlist_details_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/repo/wishlist_repo.dart';

class WishlistScreenController extends GetxController {
  RxBool isPostLoading = false.obs;
  RxBool isGetLoading = false.obs;
  RxBool toggleSuccess = false.obs;
  GetWishListDetailsModel getWishListDetailsModel = GetWishListDetailsModel();

  @override
  void onInit() {
    getWishList();
    super.onInit();
  }

// !--------------------Toggle WishList-----------------------
  Future<void> toggleWishList(Map<String, dynamic> body) async {
    WishlistRepo wishlistRepo = WishlistRepo();
    try {
      isPostLoading.value = true;
      SuccessMessageModel successMessageModel =
          await wishlistRepo.toggleWishList(body);
      toggleSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Successfully Done',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error toggling wishlist: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isPostLoading.value = false;
    }
  }

// !--------------------Get WishList Page-----------------------
  Future<GetWishListDetailsModel> getWishList() async {
    WishlistRepo wishlistRepo = WishlistRepo();
    try {
      isGetLoading.value = true;
      getWishListDetailsModel =
          await wishlistRepo.getWishList();
      return getWishListDetailsModel;
    } catch (e) {
      log("Error toggling wishlist: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Wishlist data!');
  }
}
