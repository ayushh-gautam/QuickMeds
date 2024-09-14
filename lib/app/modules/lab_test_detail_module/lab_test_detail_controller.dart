import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_lab_test_by_id.dart';
import 'package:quickmeds_user/api_collection/repo/lab_test_repo.dart';

class LabTestDetailController extends GetxController {
  // !Comment this id later on and get it from previous page
  RxBool isGetLoading = false.obs;
  GetLabTestByIdModel getLabTestByIdModel = GetLabTestByIdModel();
  final String labTestId = Get.arguments;

  @override
  void onInit() {
    getLabTestById(labTestId);
    super.onInit();
  }

  // !--------------------- Get Lab Test By Id ---------------------
  Future<GetLabTestByIdModel> getLabTestById(String labTestId) async {
    LabTestRepo labTestRepo = LabTestRepo();
    try {
      isGetLoading.value = true;
      getLabTestByIdModel = await labTestRepo.getLabTestById(labTestId);
      isGetLoading.value = false;
      return getLabTestByIdModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Lab Test By Id!');
  }
}
