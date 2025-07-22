import 'package:flutter/material.dart';

import '../models/course_data.dart';

import 'stat_card.dart';

class CourseStatsSection extends StatelessWidget {
  const CourseStatsSection({
    super.key,
    required this.courseData,
    required this.isTablet,
    required this.fontSize,
    required this.primaryColor,
  });

  final CourseData courseData;
  final bool isTablet;
  final double fontSize;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: 'جلسات',
            total: courseData.totalSessions,
            completed: courseData.completedSessions,
            missed: courseData.missedSessions,
            isTablet: isTablet,
            fontSize: fontSize,
            primaryColor: primaryColor,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(
            title: 'وظائف',
            total: courseData.totalJobs,
            completed: courseData.completedJobs,
            missed: courseData.missedJobs,
            isTablet: isTablet,
            fontSize: fontSize,
            primaryColor: primaryColor,
          ),
        ),
      ],
    );
  }
}
