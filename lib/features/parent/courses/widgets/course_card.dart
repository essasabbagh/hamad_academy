import 'package:flutter/material.dart';

import 'package:hamad/components/ui/percent_indicator.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.title,
    required this.date,
    required this.sessionsCompleted,
    required this.totalSessions,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });
  final String title;
  final String date;
  final int sessionsCompleted;
  final int totalSessions;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    //  return InkWell(
    //   borderRadius: BorderRadius.circular(16),
    //   onTap: () {
    //     //
    //   },
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).subscribedToDate(date),
                  style: const TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${S.of(context).sessionsCompleted((sessionsCompleted / totalSessions))} '
                  '$sessionsCompleted/$totalSessions',
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 4),
                PercentIndicator(
                  progress: sessionsCompleted / totalSessions,
                  progressColor: (sessionsCompleted / totalSessions) >= 0.5
                      ? AppColors.success700
                      : AppColors.color2,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: AppStyles.bodyTextStyle,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      S.of(context).courseDetails,
                      style: AppStyles.titleStyle.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
