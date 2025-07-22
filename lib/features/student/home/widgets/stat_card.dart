import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

import 'stat_item.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.total,
    required this.completed,
    required this.missed,
    required this.isTablet,
    required this.fontSize,
    required this.primaryColor,
  });

  final String title;
  final int total;
  final int completed;
  final int missed;
  final bool isTablet;
  final double fontSize;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          const BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$total $title',
            style: TextStyle(
              fontSize: fontSize + 2,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          StatItem(
            count: completed,
            label: title == 'جلسات' ? 'تم الحضور' : 'مُنجزة',
            isPositive: true,
            fontSize: fontSize,
          ),
          const SizedBox(height: 8),
          StatItem(
            count: missed,
            label: title == 'جلسات' ? 'تغيب عنها' : 'غير مُنجزة',
            isPositive: false,
            fontSize: fontSize,
          ),
        ],
      ),
    );
  }
}
