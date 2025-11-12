import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/font_family.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  const AppHeading({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppFamily.poppinsSemiBold,
          fontSize: fontSize,
          height: 0.6,
          color: AppColors.textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
