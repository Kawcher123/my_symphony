import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_theme.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  final _isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _loadTheme();
  }

  ThemeMode get theme => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _isDarkMode.value;

  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) {
    _box.write(_key, isDarkMode);
    _isDarkMode.value = isDarkMode;
  }

  void changeTheme(ThemeData theme) {
    Get.changeTheme(theme);
    update();
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    _isDarkMode.value = themeMode == ThemeMode.dark;
    saveTheme(_isDarkMode.value);
    update();
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    saveTheme(_isDarkMode.value);
    update();
  }
}
