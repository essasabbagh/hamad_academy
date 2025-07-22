import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.count,
    required this.label,
    required this.isPositive,
    required this.fontSize,
  });

  final int count;
  final String label;
  final bool isPositive;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isPositive ? AppColors.success700 : AppColors.error500,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$count $label',
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
