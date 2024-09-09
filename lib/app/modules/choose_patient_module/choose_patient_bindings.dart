import 'package:quickmeds_user/app/modules/choose_patient_module/choose_patient_controller.dart';
import 'package:get/get.dart';

class ChoosePatientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoosePatientController());
  }
}
