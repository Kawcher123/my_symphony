import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/service_center_controller.dart';

class ServiceCenterView extends GetView<ServiceCenterController> {
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
          icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Obx(
                () {
              return controller.isLoading.value
                  ? Center(child: CircularProgressIndicator()) // Show loading indicator while loading
                  : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLocation.value,
                  zoom: 12,
                ),
                onMapCreated: (GoogleMapController mapController) {
                  controller.mapController = mapController;
                },
                markers: controller.markers.toSet(),
                polylines: controller.polylines.toSet(),
                myLocationEnabled: true,
              );
            },
          ),
          Obx(()=>controller.isLoading.value?Wrap():DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
                          controller: scrollController,
                          itemCount: controller.serviceCenters.length,
                          itemBuilder: (context, index) {
                            var center = controller.serviceCenters[index];
                            return Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(center['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(center['address'], style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                  SizedBox(height: 5),
                                  Text(center['distance'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.size.width * 0.3,
                                        child: ElevatedButton.icon(
                                          onPressed: () => controller.drawPolyline(center['latLng']),
                                          icon: Icon(Icons.directions, color: Colors.white),
                                          label: Text("Directions"),
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        width: Get.size.width * 0.3,
                                        child: ElevatedButton.icon(
                                          onPressed: () => controller.drawPolyline(center['latLng']),
                                          icon: Icon(Icons.share, color: Get.theme.primaryColor),
                                          label: Text("Share", style: TextStyle(color: Get.theme.primaryColor)),
                                          style: ElevatedButton.styleFrom(backgroundColor: Get.theme.cardColor, side: BorderSide(color: Get.theme.primaryColor)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    thickness: 2,
                                    color: Get.theme.dividerColor,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
