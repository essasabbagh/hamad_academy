import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

class BadgeIconWidget extends StatelessWidget {
  const BadgeIconWidget({
    super.key,
    required this.icon,
    required this.count,
    this.borderColor = AppColors.primary100,
    this.badgeColor = AppColors.color2,
    this.badgeTextColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.size = 48,
  });
  final Widget icon;
  final int count;
  final Color borderColor;
  final Color badgeColor;
  final Color badgeTextColor;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: icon,
            // child: Icon(
            //   icon,
            //   color: iconColor,
            //   size: size * 0.5,
            // ),
          ),
        ),
        if (count > 0)
          Positioned(
            top: -12,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: badgeTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
