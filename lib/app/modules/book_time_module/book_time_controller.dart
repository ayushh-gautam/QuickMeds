import 'package:get/get.dart';

class BookTimeController extends GetxController{
  
    var selectedIndex = (-1).obs; //  selected index..

  void selectTile(int index) {
    selectedIndex.value = index; // uppdate the selected index..
  }
}