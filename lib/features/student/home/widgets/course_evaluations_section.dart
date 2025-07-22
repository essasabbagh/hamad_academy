import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

import '../models/course_data.dart';

import 'stat_item.dart';

class CourseEvaluationsSection extends StatelessWidget {
  const CourseEvaluationsSection({
    super.key,
    required this.courseData,
    required this.primaryColor,
    required this.isTablet,
    required this.fontSize,
  });

  final CourseData courseData;
  final Color primaryColor;
  final bool isTablet;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [
          BoxShadow(
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
            '${courseData.totalEvaluations} تقييمات المعلم',
            style: TextStyle(
              fontSize: fontSize + 2,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              StatItem(
                count: courseData.positiveEvaluations,
                label: 'إيجابية',
                isPositive: true,
                fontSize: fontSize,
              ),
              const SizedBox(height: 12),
              StatItem(
                count: courseData.negativeEvaluations,
                label: 'سلبية',
                isPositive: false,
                fontSize: fontSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
