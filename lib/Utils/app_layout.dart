import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static double screenH = Get.context!.height;
  static double screenW = Get.context!.width;
  static double pageView = screenH/2.64;
  static double pageViewContainer = screenH/3.84;
  static double pageTextContainer = screenH/7.03;

  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static getScreenHeight() {
    return Get.height;
  }
  static getScreenWidth() {
    return Get.width;
  }
  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }
  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}