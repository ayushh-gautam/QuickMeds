import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_lab_tests_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_product_health_model.dart';
import 'package:quickmeds_user/api_collection/repo/lab_test_repo.dart';

import '../../../api_collection/api_models/success_message_model.dart';
import '../../../api_collection/repo/product_repo.dart';
import '../../../api_collection/repo/wishlist_repo.dart';

class CategoryScreenController extends GetxController {
  bool medicineTap = true;
  bool labTestTap = false;
  bool healthProductTap = false;
  RxBool isMedicineLoading = false.obs;
  RxBool isLabTestLoading = false.obs;
  RxBool isProductHealthLoading = false.obs;

  GetMedicineModel getMedicineModel = GetMedicineModel();
  GetLabTestsModel getLabTestsModel = GetLabTestsModel();
  GetProductHealthModel getProductHealthModel = GetProductHealthModel();


  @override
  void onInit() {
    getMedicineList();
    super.onInit();
  }
    // !--------------------- Get Medicine List ---------------------
  Future<GetMedicineModel> getMedicineList() async {
    ProductRepo productRepo = ProductRepo();
    try {
      isMedicineLoading.value = true;
      getMedicineModel = await productRepo.getMedicine();
      return getMedicineModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isMedicineLoading.value = false;
    }
    throw Exception('Failed to get Medicine data!');
  }

  // !--------------------- Get Lab Test List ---------------------
  Future<GetLabTestsModel> getLabTestList() async {
    LabTestRepo labTestRepo = LabTestRepo();
    try {
      isLabTestLoading.value = true;
      getLabTestsModel = await labTestRepo.getLabTest();
      return getLabTestsModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLabTestLoading.value = false;
    }
    throw Exception('Failed to get Lab Test data!');
  }

  // !--------------------- Get Product Health List ---------------------
  Future<GetProductHealthModel> getProductHealthList() async {
    ProductRepo productRepo = ProductRepo();
    try {
      isProductHealthLoading.value = true;
      getProductHealthModel = await productRepo.getProductsHealth();
      return getProductHealthModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isProductHealthLoading.value = false;
    }
    throw Exception('Failed to get Product Health data!');
  }

  // // !--------------------Toggle WishList-----------------------
  // Future<void> toggleWishList(Map<String, dynamic> body) async {
  //   WishlistRepo wishlistRepo = WishlistRepo();
  //   try {
  //     isPostToggleLoading.value = true;
  //     SuccessMessageModel successMessageModel =
  //         await wishlistRepo.toggleWishList(body);
  //     toggleSuccess.value = true;
  //     Get.snackbar(
  //       "Success",
  //       successMessageModel.message ?? 'Successfully Done',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } catch (e) {
  //     log("Error toggling wishlist: ${e.toString()}");
  //     Get.snackbar(
  //       "Error",
  //       "Failed. Please try again.",
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } finally {
  //     isPostToggleLoading.value = false;
  //   }
  // }
}
