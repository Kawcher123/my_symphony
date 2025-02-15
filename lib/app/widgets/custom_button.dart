import 'package:flutter/material.dart';
import '../core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool isOutlined;
  final bool isLoading;
  final Widget? prefix;
  final Widget? suffix;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xFF2B4499),
    this.textColor = Colors.white,
    this.width,
    this.height,
    this.isOutlined = false,
    this.isLoading = false,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? SizeConfig.h(48),
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: onPressed == null
                      ? Colors.grey
                      : (backgroundColor ?? const Color(0xFF2B4499)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.h(8)),
                ),
              ),
              child: _buildButtonContent(),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.h(8)),
                ),
                elevation: 0,
              ),
              child: _buildButtonContent(),
            ),
    );
  }

  Widget _buildButtonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefix != null) ...[
          prefix!,
          SizedBox(width: SizeConfig.w(8)),
        ],
        if (isLoading)
          SizedBox(
            width: SizeConfig.h(20),
            height: SizeConfig.h(20),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOutlined ? (backgroundColor ?? const Color(0xFF2B4499)) : Colors.white,
              ),
            ),
          )
        else
          Text(
            text,
            style: TextStyle(
              fontSize: SizeConfig.sp(16),
              fontWeight: FontWeight.w500,
              color: isOutlined
                  ? onPressed == null
                      ? Colors.grey
                      : (backgroundColor ?? const Color(0xFF2B4499))
                  : textColor,
            ),
          ),
        if (suffix != null) ...[
          SizedBox(width: SizeConfig.w(8)),
          suffix!,
        ],
      ],
    );
  }
}
