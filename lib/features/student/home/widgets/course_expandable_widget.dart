import 'package:flutter/material.dart';

import 'package:hamad/components/course/expandable_widget.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../models/course_data.dart';

import 'widgets.dart';

class ExpandableCourseWidget extends StatelessWidget {
  const ExpandableCourseWidget({
    super.key,
    required this.courseData,
    this.primaryColor = AppColors.primary500,
    this.backgroundColor = AppColors.white,
  });

  final CourseData courseData;
  final Color primaryColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        final cardPadding = isTablet ? 24.0 : 16.0;
        final fontSize = isTablet ? 16.0 : 14.0;
        final titleFontSize = isTablet ? 20.0 : 18.0;

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isTablet ? 16.0 : 12.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ExpandableWidget(
            header: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: CourseHeader(
                title: courseData.title,
                iconUrl: courseData.iconPath,
                titleFontSize: titleFontSize,
                isTablet: isTablet,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                cardPadding,
                0,
                cardPadding,
                cardPadding,
              ),
              child: Column(
                children: [
                  CourseStatsSection(
                    courseData: courseData,
                    isTablet: isTablet,
                    fontSize: fontSize,
                    primaryColor: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  CourseEvaluationsSection(
                    courseData: courseData,
                    isTablet: isTablet,
                    fontSize: fontSize,
                    primaryColor: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  CourseCommitmentSection(
                    courseData: courseData,
                    isTablet: isTablet,
                    fontSize: fontSize,
                    primaryColor: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  CourseActionButtons(
                    fontSize: fontSize,
                    isTablet: isTablet,
                    primaryColor: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
