import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:momagictask/app/core/theme/theme_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController


  
  final List<Map<String, String>> trendingItems = [
    {
      'title': 'Mobiles',
      'imagePath': 'assets/images/t1.png',
    },
    {
      'title': 'Watches',
      'imagePath': 'assets/images/t2.png',
    },
    {
      'title': 'Accessories',
      'imagePath': 'assets/images/t3.png',
    },
  ];



  @override
  void onInit() {
    super.onInit();
    // Theme will be set through bindings instead
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
