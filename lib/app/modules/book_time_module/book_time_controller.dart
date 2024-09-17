import 'package:get/get.dart';

class BookTimeController extends GetxController {
  var times = [
    "1:00 pm - 2:00 pm",
    "2:00 pm - 3:00 pm",
    "3:00 pm - 4:00 pm",
    "4:00 pm - 5:00 pm",
    "5:00 pm - 6:00 pm",
  ];
  var pricing = [
    "₹19",
    "₹20",
    "₹15",
    "₹19",
    "₹19",
  ];
  var selectedIndex = (-1).obs; //  selected index..

  void selectTile(int index) {
    selectedIndex.value = index; // uppdate the selected index..
  }
}
