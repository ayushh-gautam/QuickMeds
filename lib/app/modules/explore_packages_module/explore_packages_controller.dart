import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_model.dart';
import 'package:quickmeds_user/api_collection/repo/test_repo.dart';

class ExplorePackagesController extends GetxController {
  RxBool isGetLoading = false.obs;

  GetTestPackagesModel getTestPackagesModel = GetTestPackagesModel();

  @override
  void onInit() {
    getTestPackagesList();
    super.onInit();
  }

  // !--------------------- Get Test Packages List ---------------------
  Future<GetTestPackagesModel> getTestPackagesList() async {
    TestRepo testRepo = TestRepo();
    try {
      isGetLoading.value = true;
      getTestPackagesModel = await testRepo.getTestPackages();
      return getTestPackagesModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Test Packages data!');
  }
}
