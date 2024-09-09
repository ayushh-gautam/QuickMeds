import 'package:get/get.dart';

class TimeSlotController extends GetxController {
  bool isSelected = false;
  int selectedDuration = 0;
  setSelectedRadio(int val) {
    selectedDuration = val;
    update();
  }
}
