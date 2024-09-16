import 'package:get/get.dart';

class LabTestCartController extends GetxController {
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  List<String> reasons = [
    "Test not required",
    "Found better place elsewhere",
    "My preferral collection slot is not available",
    "Need to change sample collection address",
    "Collection agent not assigned on time",
    "Collection agent not arrived",
    "Need to change patient details",
    "Need to add/remove tests",
    "Need to change payment methods",
    "Order placed by mistake",
  ];

  var selectedReasonIndex = (-1).obs;
  // check if a reason has been selected
  bool get isButtonEnabled => selectedReasonIndex.value != -1;

  // update the radio button
  void selectReason(int index) {
    selectedReasonIndex.value = index;
    update();
  }
}
