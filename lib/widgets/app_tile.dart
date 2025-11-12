import 'package:clika/theme/app_colors.dart';
import 'package:clika/widgets/normal_text.dart';
import 'package:flutter/material.dart';

import 'headings/app_heading.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.icons,
    required this.titles,
    required this.subtitles,
    required this.onPressed,
  });

  final IconData icons;
  final String titles;
  final String subtitles;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.containerBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icons, color: Colors.blueAccent),
        ),
        title: AppHeading(text: titles, fontSize: 14),
        subtitle: NormalText(text: subtitles, textAlign: TextAlign.left),
      ),
    );
  }
}
