import 'package:get/get.dart';
/**
 * 
 * */

class MyLabTestController extends GetxController {
  // var _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

//------------------------- for booking status -------------------------------//
  var bookingStatusData = ['On the way', 'Completed', 'Cancelled'];
  var bookingStatusChecked = List<bool>.generate(3, (index) => false).obs;
 void toggleBookingStatusCheckbox(int index) {
    bookingStatusChecked[index] = !bookingStatusChecked[index];
  }

//--------------------------for booking time----------------------------------//
  var bookingTimeData = ['Last 30 days', '2023', '2022', '2021', 'Older'];
  var bookingTimeChecked = List<bool>.generate(5, (index) => false).obs;

  void toggleBookingTimeCheckbox(int index) {
    bookingTimeChecked[index] = !bookingTimeChecked[index];
  }

//-------------------------for clearing selected checkbox---------------------//
  void clearAllCheckboxes() {
    for (int i = 0; i < bookingStatusChecked.length; i++) {
      bookingStatusChecked[i] = false;
    }
    for (int i = 0; i < bookingTimeChecked.length; i++) {
      bookingTimeChecked[i] = false;
    }
  }
}
