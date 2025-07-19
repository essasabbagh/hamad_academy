import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/extensions/extensions.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/utils/snackbars.dart';
import 'package:hamad/features/home/models/course_data.dart';

class ExpandableCourseWidget extends StatefulWidget {
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
  State<ExpandableCourseWidget> createState() => _ExpandableCourseWidgetState();
}

class _ExpandableCourseWidgetState extends State<ExpandableCourseWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

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
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(alpha: .08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header
              InkWell(
                onTap: _toggleExpansion,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Course Icon
                      Container(
                        width: isTablet ? 48 : 40,
                        height: isTablet ? 48 : 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // color: widget.primaryColor.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image(
                          image: NetworkImage(widget.courseData.iconPath),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Course Title
                      Expanded(
                        child: Text(
                          widget.courseData.title,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Expand/Collapse Icon
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          // color: AppColors.,
                          size: isTablet ? 48 : 42,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expandable Content
              SizeTransition(
                sizeFactor: _expandAnimation,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    cardPadding,
                    0,
                    cardPadding,
                    cardPadding,
                  ),
                  child: Column(
                    children: [
                      // Sessions and Jobs Stats
                      _buildStatsSection(isTablet, fontSize),
                      const SizedBox(height: 24),
                      // Teacher Evaluations
                      _buildEvaluationsSection(isTablet, fontSize),
                      const SizedBox(height: 24),
                      // Commitment Percentage
                      _buildCommitmentSection(isTablet, fontSize),
                      const SizedBox(height: 24),
                      // Action Buttons
                      _buildActionButtons(isTablet, fontSize),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatsSection(bool isTablet, double fontSize) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'جلسات',
            total: widget.courseData.totalSessions,
            completed: widget.courseData.completedSessions,
            missed: widget.courseData.missedSessions,
            isTablet: isTablet,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: 'وظائف',
            total: widget.courseData.totalJobs,
            completed: widget.courseData.completedJobs,
            missed: widget.courseData.missedJobs,
            isTablet: isTablet,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required int total,
    required int completed,
    required int missed,
    required bool isTablet,
    required double fontSize,
  }) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: widget.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                count: completed,
                label: title == 'جلسات' ? 'تم الحضور' : 'مُنجزة',
                isPositive: true,
                fontSize: fontSize,
              ),
              const SizedBox(height: 8),
              _buildStatItem(
                count: missed,
                label: title == 'جلسات' ? 'تغيب عنها' : 'غير مُنجزة',
                isPositive: false,
                fontSize: fontSize,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required int count,
    required String label,
    required bool isPositive,
    required double fontSize,
  }) {
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
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  Widget _buildEvaluationsSection(bool isTablet, double fontSize) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            '${widget.courseData.totalEvaluations} تقييمات المعلم',
            style: TextStyle(
              fontSize: fontSize + 2,
              fontWeight: FontWeight.bold,
              color: widget.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                count: widget.courseData.positiveEvaluations,
                label: 'إيجابية',
                isPositive: true,
                fontSize: fontSize,
              ),
              const SizedBox(height: 12),

              _buildStatItem(
                count: widget.courseData.negativeEvaluations,
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

  Widget _buildCommitmentSection(bool isTablet, double fontSize) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
                  color: widget.primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: widget.courseData.commitmentPercentage >= 50
                      ? AppColors.success700
                      : AppColors.color2,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${widget.courseData.commitmentPercentage.toInt()}%',
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
            percent: widget.courseData.commitmentPercentage / 100,
            lineHeight: 8.0,
            isRTL: context.isRtl,
            padding: EdgeInsets.zero,
            barRadius: const Radius.circular(4),
            progressColor: widget.courseData.commitmentPercentage >= 50
                ? AppColors.success700
                : AppColors.color2,
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.iconsAlert,
                colorFilter: ColorFilter.mode(
                  widget.courseData.commitmentPercentage >= 50
                      ? AppColors.success700
                      : AppColors.color2,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${widget.courseData.motivationalMessage} 👋',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: widget.courseData.commitmentPercentage >= 50
                        ? AppColors.success700
                        : AppColors.color2,
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

  Widget _buildActionButtons(bool isTablet, double fontSize) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              AppSnackBar.info(
                'تواصل مع المعلم',
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.primaryColor,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(
                vertical: isTablet ? 16 : 12,
                horizontal: isTablet ? 24 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تواصل مع المعلم',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.color2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              AppSnackBar.info(
                'تفاصيل المادة',
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.accent600,
              backgroundColor: AppColors.accent600,
              side: BorderSide(color: Colors.amber.shade400),
              padding: EdgeInsets.symmetric(
                vertical: isTablet ? 16 : 12,
                horizontal: isTablet ? 24 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'تفاصيل المادة',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
