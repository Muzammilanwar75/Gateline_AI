import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.buttonColor,
    this.size,
    this.textColor,
    this.fontSize,
    this.showLeftIcon = false,
    this.icon,
    this.borderRadius = 8.0,
    this.fontWeight,
    this.bordercolor = Colors.transparent,
  });
  final String text;
  final VoidCallback? onPressed;
  final Size? size;
  final Color color;
  final Color? textColor;
  final IconData? icon;
  final double? fontSize;
  final double borderRadius;
  final Color bordercolor;
  bool showLeftIcon = false;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size?.width,
        height: size?.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor),
          color: onPressed == null
              ? const Color(0xffFA921F).withOpacity(0.5)
              : color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: "Poppins-Medium",
            fontSize: fontSize ?? 16,
            color: textColor ?? Color(0xffF8F8F8),
            fontWeight: fontWeight ?? FontWeight.w700,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showLeftIcon && icon != null) ...[
                Icon(icon, color: textColor ?? Color(0xffF8F8F8)),
                SizedBox(width: 8),
              ],
              Text(text),
              if (!showLeftIcon && icon != null) ...[
                SizedBox(width: 8),
                Icon(icon, color: textColor ?? Color(0xffF8F8F8)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
