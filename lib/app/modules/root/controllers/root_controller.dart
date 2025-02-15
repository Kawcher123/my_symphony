import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController with GetSingleTickerProviderStateMixin{
  final selectedIndex = 1.obs;


  @override
  void onInit() {
    super.onInit();

  }


  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
