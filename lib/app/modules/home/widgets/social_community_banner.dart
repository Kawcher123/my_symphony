import 'package:flutter/material.dart';

class SocialCommunityBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const SocialCommunityBanner({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/images/b2.png'),
            fit: BoxFit.cover,
          ),
        ),

      ),
    );
  }
}
