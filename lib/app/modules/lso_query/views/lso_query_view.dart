import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:momagictask/app/widgets/custom_button.dart';
import 'package:momagictask/app/widgets/custom_text_field.dart';

import '../controllers/lso_query_controller.dart';

class LsoQueryView extends GetView<LsoQueryController> {
  const LsoQueryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: () => Get.back(),
        ),
        title: Text('LSO Query', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: Colors.redAccent),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Tracking',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text('Enter LSO', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),


                    CustomTextField(hintText: 'Enter LSO : eg : PAN-00950100'),
                    SizedBox(height: 20),
                    CustomButton(
                      width: Get.size.width*0.4,
                      text: 'Get Information',
                      onPressed: () {},
                      backgroundColor: Get.theme.primaryColor,
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
