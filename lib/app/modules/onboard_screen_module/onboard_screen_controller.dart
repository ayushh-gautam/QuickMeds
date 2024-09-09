import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreenController extends GetxController {
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController?.dispose();
    super.onClose();
  }

  PageController? pageController;
  int currentIndex = 0;
  static const kDuration = Duration(milliseconds: 300);
  static const kCurve = Curves.ease;
  nextFunction() {
    pageController?.nextPage(duration: kDuration, curve: kCurve);
    update();
  }

  final totalDots = 3;
  double _currentPosition = 0.0;
  void _updatePosition(double position) {
    _currentPosition = _validPosition(position);
  }

  double _validPosition(double position) {
    if (position >= totalDots) return 0;
    if (position < 0) return totalDots - 1.0;
    return position;
  }

  onChangedFunction(int index) {
    // setState(() {
    currentIndex = index;
    _updatePosition(currentIndex.toDouble());
    update();
    // });
  }
}
