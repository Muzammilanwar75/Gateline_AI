import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback? onPressed;
  const GradientButton({
    super.key,
    required this.text,
    this.height = 35,
    this.width = 120,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, AppColors.primaryColor],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
