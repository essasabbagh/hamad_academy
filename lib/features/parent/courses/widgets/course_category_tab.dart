import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_fonts.dart';

class CourseCategoryTab extends StatelessWidget {
  const CourseCategoryTab({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? AppColors.color2 : null,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.primary100,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.white : null,
          fontFamily: AppFont.fontFamily,
        ),
      ),
    );
  }
}
