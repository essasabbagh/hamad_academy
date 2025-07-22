import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/extensions/extensions.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../models/course_data.dart';

class CourseCommitmentSection extends StatelessWidget {
  const CourseCommitmentSection({
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
    final bool isHighCommitment = courseData.commitmentPercentage >= 50;
    final Color progressColor = isHighCommitment
        ? AppColors.success700
        : AppColors.color2;

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'نسبة الإلتزام',
                style: TextStyle(
                  fontSize: fontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${courseData.commitmentPercentage.toInt()}%',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearPercentIndicator(
            percent: courseData.commitmentPercentage / 100,
            lineHeight: 8.0,
            isRTL: context.isRtl,
            padding: EdgeInsets.zero,
            barRadius: const Radius.circular(4),
            progressColor: progressColor,
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.iconsAlert,
                colorFilter: ColorFilter.mode(
                  progressColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${courseData.motivationalMessage} 👋',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: progressColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
