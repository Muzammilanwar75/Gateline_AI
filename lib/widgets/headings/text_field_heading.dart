import 'package:flutter/material.dart';

import '../../../utils/font_family.dart';

class TextFieldHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  const TextFieldHeading({required this.text, this.fontSize = 12, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppFamily.poppinsMedium,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
