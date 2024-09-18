import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class BookingSummaryController extends GetxController {
  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  var title = [
    'Iron man',
    '29 Feb 2024, 12 PM - 1PM',
    'Office (Ashar it 402,thane)'
  ];

  var subtitle = [
    'Male,23',
    'Sample collation slot',
    'Sample collation address'
  ];

  var billTitle = [
    'Cart MRP',
    'Other services',
    'Total discount',
  ];
  var billCost = ['₹4398', '₹19', '-₹2201'];

  List<Icon> icons = const [
    Icon(Icons.person),
    Icon(CupertinoIcons.calendar),
    Icon(Icons.gps_fixed),
  ];
}
