import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class SizeConfig {
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;
  
  // Responsive height calculation
  static double h(double height) {
    return (height / 812.0) * screenHeight;
  }
  
  // Responsive width calculation
  static double w(double width) {
    return (width / 375.0) * screenWidth;
  }
  
  // Responsive font size calculation
  static double sp(double size) {
    return (size / 375.0) * screenWidth;
  }
  
  // Responsive padding/margin calculation
  static double p(double size) {
    return (size / 375.0) * screenWidth;
  }

  // Check if device is tablet
  static bool get isTablet {
    final double devicePixelRatio = Get.pixelRatio;
    final double width = screenWidth * devicePixelRatio;
    final double height = screenHeight * devicePixelRatio;
    final double diagonalInches = 
        math.sqrt(width * width + height * height) / (devicePixelRatio * 160);
    return diagonalInches >= 7.0;
  }

  // Get responsive value based on screen size
  static double getResponsiveValue({
    required double forShortScreen,
    required double forLongScreen,
  }) {
    return screenHeight < 800 ? forShortScreen : forLongScreen;
  }

  // Get proportionate height according to screen size
  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight;
  }

  // Get proportionate width according to screen size
  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth;
  }
}
