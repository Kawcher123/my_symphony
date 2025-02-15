import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;

  const StatusChip({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 12,
  });

  factory StatusChip.onGoing() {
    return const StatusChip(
      text: 'On going',
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
  }

  factory StatusChip.completed() {
    return const StatusChip(
      text: 'Completed',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  factory StatusChip.pending() {
    return const StatusChip(
      text: 'Pending',
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
  }

  factory StatusChip.status({String? text}) {
    print('StatusChip.status:$text');
    return text == 'pending'
        ? StatusChip.pending()
        : text == 'on going'
            ? StatusChip.onGoing()
            : text == 'completed'
                ? StatusChip.completed()
                : StatusChip.pending();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
