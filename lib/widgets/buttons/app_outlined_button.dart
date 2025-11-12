import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.size,
  });

  final VoidCallback? onTap;
  final Size? size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size?.height,
        width: size?.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xffA1A1A1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
