import 'package:flutter/material.dart';

class CustomRadioGroup extends StatelessWidget {
  final String label;
  final List<String> options;
  final String value;
  final Function(String) onChanged;

  const CustomRadioGroup({
    Key? key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: options.map((option) {
            return Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: value,
                    onChanged: (value) => onChanged(value!),
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Text(
                    option,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
