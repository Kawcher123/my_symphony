import 'package:flutter/material.dart';
import '../core/utils/size_config.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  final double? titleFontSize;
  final double? valueFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? valueFontWeight;

  const StatusItem({
    Key? key,
    required this.title,
    required this.value,
    this.valueColor,
    this.titleFontSize,
    this.valueFontSize,
    this.titleFontWeight,
    this.valueFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize ?? SizeConfig.sp(14),
            fontWeight: titleFontWeight ?? FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueFontSize ?? SizeConfig.sp(14),
            fontWeight: valueFontWeight ?? FontWeight.w500,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
