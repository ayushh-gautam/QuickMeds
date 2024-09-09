import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_reminder_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/repo/medicine_reminder_repo.dart';

class EditMedicineReminderController extends GetxController {
  MedicineReminder medicineReminder = Get.arguments;
  int selectedCategory = -1;
  int selectedType = -1;
  bool isSelected = false;
  int selectedDuration = -1;
  int selectedDays = -1;
  RxInt hourSetter = 6.obs;
  RxInt minuteSetter = 1.obs;
  RxInt amPmSetter = 0.obs;
  RxInt numberOfDays = 1.obs;
  RxInt remindEvery = 2.obs;
  RxBool isLoading = false.obs;
  RxBool reminderAddedSuccess = false.obs; // Make this reactive

  RxMap<String, bool> days = {
    "Sunday": false,
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
    "Saturday": false,
  }.obs;

  List<String> medicineCategories = ["Capsule", "Tablet", "Syrup", "Injection"];

  List<String> typeCategories = ['Count', 'ML'];

  List<String> durationList = ["Continuous", "Number of days"];

  List<String> daysList = ["Everyday", "Specific Days", "Remind every"];

  String? date;
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void onInit() {
    medicineNameController.text = medicineReminder.medicineName.toString();
    quantityController.text = medicineReminder.value.toString();
    switch (medicineReminder.category) {
      case "Capsule":
        selectedCategory = 0;
        break;
      case "Tablet":
        selectedCategory = 1;
        break;
      case "Syrup":
        selectedCategory = 2;
        break;
      case "Injection":
        selectedCategory = 3;
        break;
      default:
        selectedCategory = -1;
    }
    selectedType = medicineReminder.type == "Count" ? 0 : 1;
    selectedDuration = medicineReminder.duration == "Continuous" ? 0 : 1;
    selectedDuration == 1
        ? numberOfDays.value = int.parse(medicineReminder.duration.toString())
        : numberOfDays.value = 1;
    selectedDays = medicineReminder.days == "Everyday"
        ? 0
        : RegExp(r'^\d+$').hasMatch(medicineReminder.days.toString())
            ? 2
            : 1;
    // !--------------------- Set the remindEvery value ---------------------
    selectedDays == 2
        ? remindEvery.value = int.parse(medicineReminder.days.toString())
        : remindEvery.value = 2;
    // !--------------------- Set the days to true ---------------------
    if (selectedDays == 1) {
      // If selectedDays is 1, split the string and set the corresponding days to true
      List<String> selectedDaysList =
          medicineReminder.days.toString().split(',');

      // Reset all days to false first
      days.updateAll((key, value) => false);

      // Set the days that are in the selectedDaysList to true
      for (var day in selectedDaysList) {
        if (days.containsKey(day.trim())) {
          days[day.trim()] = true;
        }
      }
    } else {
      // If selectedDays is not 1, reset all days to false
      days.updateAll((key, value) => false);
    }

    // !----------------Set the date-------------------
    date = DateFormat('MM/dd/yyyy').format(medicineReminder.startDate!);
    log("Date: $date");

    // !----------------Set the time-------------------
    List<String> time = medicineReminder.time!.split(':');
    int.parse(time[0]) > 12 ? amPmSetter.value = 1 : amPmSetter.value = 0;
    hourSetter.value =
        int.parse(time[0]) > 12 ? int.parse(time[0]) - 12 : int.parse(time[0]);
    minuteSetter.value = int.parse(time[1].substring(0, 2));
    super.onInit();
  }

// !--------------------- Update Medicine Reminder ---------------------
  Future<void> updateMedicineReminder(Map<String, dynamic> body) async {
    MedicineReminderRepo medicineReminderRepo = MedicineReminderRepo();
    try {
      isLoading.value = true;
      SuccessMessageWithIdModel successMessageModel = await medicineReminderRepo
          .updateMedicineReminder(body: body, id: medicineReminder.id!.toString());
      reminderAddedSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Medicine Reminder updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending reminder: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to update medicine Reminder. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  setSelectedRadio(int val) {
    selectedDuration = val;
    update();
  }

  setSelectedDays(int val) {
    selectedDays = val;
    update();
  }

  void updateDay(String day, bool value) {
    days[day] =
        value; // This automatically triggers the reactive system in GetX
  }

  ///DATE TIME PICKER
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        selectableDayPredicate: _selectableDayPredicate,
        initialDate: selectedDate,
        firstDate: DateTime(1947),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String formattedDate = DateFormat('MM/dd/yyyy').format(selectedDate);
      log(selectedDate.toString());
      log(formattedDate);
      date = formattedDate.toString();
      update();
    }
  }

  bool _selectableDayPredicate(DateTime day) {
    // Allow only future dates``
    return !day.isBefore(DateTime.now().add(const Duration(days: -1)));
  }

  @override
  void dispose() {
    medicineNameController.dispose();
    quantityController.dispose();
    super.dispose();
  }
}
