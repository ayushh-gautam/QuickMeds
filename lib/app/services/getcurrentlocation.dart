import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getCurrentLocation() async {
  try {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.denied) {
      final permissionStatus = await Geolocator.requestPermission();
      if (permissionStatus != LocationPermission.whileInUse &&
          permissionStatus != LocationPermission.always) {
        throw Exception(
            'Location permissions are denied (actual value: $permissionStatus).');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    String locationName =
        await _convertLatitudeToAddress(position.latitude, position.longitude);
    log("Location: $locationName");
    return locationName;
  } catch (e) {
    log("Exception caught: $e");
    Fluttertoast.showToast(
      msg: e.toString(),
      backgroundColor: Colors.red,
    );
  }
  return '';
}

Future<String> _convertLatitudeToAddress(
    double latitude, double longitude) async {
  String address = '';
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    // log("Placemarks: ${placemarks.first}");
    address = placemarks.first.subLocality.toString();
  } catch (e) {
    log("Exception caught: $e");
  }
  return address;
}
