import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_by_id_model.dart';

import '../../../api_collection/repo/test_repo.dart';

class PackagesDetailController extends GetxController {
  String packageId = "1";
  // !Comment this id later on and get it from previous page
  GetTestPackagesByIdModel getTestPackagesByIdModel = GetTestPackagesByIdModel();
  RxBool isGetLoading = false.obs;

  @override
  void onInit() {
    getTestPackagesById(packageId);
    super.onInit();
  }

  // !--------------------- Get Test Packages By Id ---------------------
  Future<GetTestPackagesByIdModel> getTestPackagesById(String packageId) async {
    TestRepo testRepo = TestRepo();
    try {
      isGetLoading.value = true;
      getTestPackagesByIdModel = await testRepo.getTestPackagesById(packageId);
      return getTestPackagesByIdModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Test Packages By Id!');
  }

}
