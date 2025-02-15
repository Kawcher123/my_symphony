import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/specification_controller.dart';
import '../widgets/specification_card_widget.dart';

class SpecificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        title: Text("Specification"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Get.theme.primaryColor,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SpecificationCardWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.3,
                title: "Powered by",
                value: "Android™ 14",
                icon: Icons.android),
            Row(
              children: [
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.45,
                      title: "Processor",
                      value: "MediaTek Helio G99\n6nm 2.2GHz Octa Core",
                      icon: Icons.memory),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.45,
                      title: "Storage",
                      value: "ROM 128GB",
                      icon: Icons.sd_storage),
                ),
              ],
            ),
            SpecificationCardWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.4,
                title: "Display",
                value: "6.7\" FHD+ AMOLED GG5 120Hz\nPunch Hole",
                icon: Icons.phone_android),
            Row(
              children: [
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.4,
                      title: "RAM",
                      value: "16GB (8GB Expandable RAM)",
                      icon: Icons.memory),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.4,
                      title: "Sim Card",
                      value: "Nano+Nano/Micro TF Card",
                      icon: Icons.sim_card),
                ),
              ],
            ),
            SpecificationCardWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.45,
                title: "Camera",
                value: "64MP + 2MP Macro Rear & 32MP Super Selfie\nwith Display Flash",
                icon: Icons.camera),
            Row(
              children: [
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.3,
                      title: "Network",
                      value: "4G, 3G, 2G",
                      icon: Icons.network_check),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SpecificationCardWidget(
                      width: MediaQuery.of(context).size.width / 2 - 12,
                      height: MediaQuery.of(context).size.width*0.3,
                      title: "Battery",
                      value: "5000mAh",
                      icon: Icons.battery_full),
                ),
              ],
            ),
            SpecificationCardWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.4,
                title: "Device Sensors",
                value: "Fingerprint/Proximity/Light/Gravity/Magnetic/Gyro Sensor",
                icon: Icons.sensors),
          ],
        ),
      ),
    );
  }
}
