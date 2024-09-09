import 'package:quickmeds_user/app/modules/add_patient_module/add_patient_controller.dart';
import 'package:get/get.dart';

class AddPatientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPatientController());
  }
}
