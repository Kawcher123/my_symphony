import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificationCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final double width;
  final double height;

  SpecificationCardWidget({
    required this.title,
    required this.value,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Get.theme.primaryColor, size: 32),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(height: 4),
          Text(value,
              style: TextStyle(
                  color: Get.theme.textTheme.titleMedium?.color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
