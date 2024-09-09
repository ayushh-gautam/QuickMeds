import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_deal_by_id_model.dart';

import '../../../api_collection/repo/product_repo.dart';

class TopSellingScreenController extends GetxController {
  // var arg = Get.arguments;
  // !Uncomment this later on
  var arg = false;
  GetDealByIdModel getDealByIdModel = GetDealByIdModel();
  RxBool isGetLoading = false.obs;

  @override
  void onInit() {
    // print("email::::::$arg");
    getTopSellingList("1");
    // !Change the id later on
    super.onInit();
  }

  // !----------------------Get Top Selling List---------------------
  Future<GetDealByIdModel> getTopSellingList(String id) async {
    ProductRepo productRepo = ProductRepo();

    try {
      isGetLoading.value = true;
      getDealByIdModel = await productRepo.getTopSellingProductList(id);
      return getDealByIdModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Top Selling products!');
  }
}
