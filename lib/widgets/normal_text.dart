import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NormalText extends StatelessWidget {
  final String text;
  final double? fontSize;
  Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  NormalText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: color ?? Colors.grey,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
