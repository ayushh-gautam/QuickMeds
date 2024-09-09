import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/repo/medicine_reminder_repo.dart';

class AddMedicineReminderController extends GetxController {
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


// !-----------------Send Medicine Reminder-----------------
  Future<void> addMedicineReminder(Map<String, dynamic> body) async {
    MedicineReminderRepo medicineReminderRepo = MedicineReminderRepo();
    try {
      isLoading.value = true;
      SuccessMessageWithIdModel successMessageModel =
          await medicineReminderRepo.sendMedicineReminder(body);
      reminderAddedSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Medicine Reminder added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending reminder: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to add medicine Reminder. Please try again.",
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
