import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_lab_tests_model.dart';
import 'package:quickmeds_user/api_collection/repo/lab_test_repo.dart';
/**
 * 
 * */

class LabTestController extends GetxController {
  // var _obj = ''.obs;
  GetLabTestsModel labtestsModel = GetLabTestsModel();

  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() {
    super.onInit();
    getLabTestList();
  }

  Future<GetLabTestsModel> getLabTestList() async {
    LabTestRepo labtestRepo = LabTestRepo();

    try {
      labtestsModel = await labtestRepo.getLabTest();
      print("I Am Printer---------> $labtestsModel");

      return labtestsModel ;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tests, please try again :(',
          snackPosition: SnackPosition.BOTTOM);
    }
    throw Exception('try another year');
  }
}
