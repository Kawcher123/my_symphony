import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momagictask/app/core/theme/theme_controller.dart';

import 'app/core/theme/app_theme.dart';
import 'app/routes/app_pages.dart';


Future<void> initServices()async{
  await GetStorage.init();
  Get.put(ThemeController());
}
void main() async {

  await initServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MoMagic",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: Get.find<ThemeController>().theme,
      ),
    );
  });


}
