import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class ActionsButton extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onPressed;
  const ActionsButton({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: AppColors.cardColor,
        elevation: 3,
        shadowColor: Colors.white,
        shape: const BeveledRectangleBorder(),
        child: SizedBox(
          height: 46,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(image),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
