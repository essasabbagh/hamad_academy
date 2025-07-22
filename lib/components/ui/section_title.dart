import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.trailingWidget,
  });

  final String title;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: AppStyles.largeHeadingTextStyle.copyWith(
              color: AppColors.primary700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailingWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}
