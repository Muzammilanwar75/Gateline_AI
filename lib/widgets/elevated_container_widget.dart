import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

Widget appContainer({required Widget child}) {
  return Column(
    children: [
      Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.cardColor,
          ),
          child: child,
        ),
      ),
    ],
  );
}
