import 'package:quickmeds_user/app/modules/upload_prescription_module/upload_prescription_controller.dart';
import 'package:get/get.dart';

class UploadPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadPrescriptionController());
  }
}
