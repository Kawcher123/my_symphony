import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:momagictask/app/routes/app_pages.dart';
import 'package:momagictask/app/widgets/square_card_widget.dart';

import '../controllers/check_support_controller.dart';

class CheckSupportView extends GetView<CheckSupportController> {
  const CheckSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Check Support',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: controller.supportItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = controller.supportItems[index];
            return SquareCardWidget(
              iconPath: item['icon'] ?? '',
              title: item['title'] ?? '',
              onTap: () {
                if(item['route']!=null&&item['route']!=''){
                  Get.toNamed(item['route'] ?? "");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
