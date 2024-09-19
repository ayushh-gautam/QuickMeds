import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_lab_tests_model.dart';
import 'package:quickmeds_user/api_collection/repo/lab_test_repo.dart';
/**
 * 
 * */

class LabTestController extends GetxController {
  var isLoading = false.obs;
  GetLabTestsModel labtestsModel = GetLabTestsModel();
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  int currentIndex = 0;

  CarouselController carouselController = CarouselController();
  @override
  void onInit() {
    super.onInit();
    getLabTestList();
  }

  Future<GetLabTestsModel> getLabTestList() async {
    LabTestRepo labtestRepo = LabTestRepo();

    try {
      isLoading.value = true;
      labtestsModel = await labtestRepo.getLabTest();
      print("I Am Printer---------> $labtestsModel");
      isLoading.value = false;
      return labtestsModel;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tests, please try again :(',
          snackPosition: SnackPosition.BOTTOM);
    }
    throw Exception('try another year');
  }



 

}
