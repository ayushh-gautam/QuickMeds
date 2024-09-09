import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_products_model_by_id_model.dart';

import '../../../api_collection/repo/product_repo.dart';

class ProductDetailScreenController extends GetxController {
  String productId = "17";
  // !Comment this id later on and get it from previous page
  GetProductsByIdModel getProductsByIdModel = GetProductsByIdModel();
  RxBool isGetLoading = false.obs;
  RxInt isSelectedItem = 0.obs;
  RxBool isOutOfStock = false.obs;
  RxInt totalQuantity = 1.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt isSelectedVariant = 0.obs;

  @override
  void onInit() {
    getProductsById(productId);
    super.onInit();
  }

  setTotalPrice(double price) {
    totalPrice.value = price * totalQuantity.value;
    update();
  }

  // !--------------------- Set Quantity---------------------
  incrementQuantity() {
    totalQuantity.value++;

    update();
  }

  decrementQuantity() {
    if (totalQuantity.value > 1) {
      totalQuantity.value--;
    }
    update();
  }

// !--------------------- Set Out of Stock Item ---------------------
  setOutOfStock(bool value) {
    isOutOfStock = value.obs;
    update();
  }

  // !--------------------- Get Products By Id ---------------------
  Future<GetProductsByIdModel> getProductsById(String productId) async {
    ProductRepo productRepo = ProductRepo();
    try {
      isGetLoading.value = true;
      getProductsByIdModel = await productRepo.getProductsById(productId);
      return getProductsByIdModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
      setTotalPrice(
          getProductsByIdModel.product!.variants!.first.sellingPrice!);
    }
    throw Exception('Failed to get Products By Id!');
  }
}
