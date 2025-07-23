import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.leading,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget? leading;
  final bool isCompleted;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      trailing: isCompleted
          ? const SvgAsset(
              AppImages.iconsDoneOutline,
              color: AppColors.success600,
              width: 24,
            )
          : null,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
