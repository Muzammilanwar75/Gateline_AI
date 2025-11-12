import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/font_family.dart';

class AppSubHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  const AppSubHeading({required this.text, this.fontSize = 14, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFamily.barlowSemiBold,
        fontSize: fontSize,
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
