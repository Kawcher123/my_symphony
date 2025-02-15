import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;

  const SectionTitle({
    super.key,
    required this.title,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onSeeMore != null)
          TextButton(
            onPressed: onSeeMore,
            child: Row(
              children: [
                Text(
                  'See more',
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Get.theme.primaryColor,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
