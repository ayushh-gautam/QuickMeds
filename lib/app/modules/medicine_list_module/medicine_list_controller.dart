import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_model.dart';

import '../../../api_collection/repo/product_repo.dart';


class MedicineListController extends GetxController {
  RxBool isGetLoading = false.obs;

  GetMedicineModel getMedicineModel = GetMedicineModel();

    @override
  void onInit() {
    getMedicineList();
    super.onInit();
  }

  // !--------------------- Get Medicine List ---------------------
  Future<GetMedicineModel> getMedicineList() async {
    ProductRepo productRepo = ProductRepo();
    try {
      isGetLoading.value = true;
      getMedicineModel = await productRepo.getMedicine();
      return getMedicineModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Medicine data!');
  }
}
