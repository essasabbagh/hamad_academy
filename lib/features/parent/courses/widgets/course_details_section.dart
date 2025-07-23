import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:hamad/components/session/full_width_button.dart';
import 'package:hamad/components/session/session_state.dart';
import 'package:hamad/components/ui/percent_indicator.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_styles.dart';

class CourseDetailsSection extends StatelessWidget {
  const CourseDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '8 جلسات',
              style: AppStyles.headingTextStyle,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'نسبة الإلتزام',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: 87 >= 50 ? AppColors.success700 : AppColors.color2,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  '${87}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const PercentIndicator(
            progress: 0.8,
            progressColor: 0.8 >= 0.5 ? AppColors.success700 : AppColors.color2,
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SessionState(
                count: 2,
                label: 'جلسة تم الحضور',
                isPositive: true,
              ),
              SessionState(
                count: 3,
                label: 'جلسات تغيب عنها',
                isPositive: false,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.iconsAlert,
                width: 32,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary800,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 16),

              const Expanded(
                child: Text(
                  'نسبة الالتزام في هذه المادة أقل من 70%. ننصح بمتابعة طفلك أو التواصل مع المعلم.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary800,
                  ),
                ),
              ),
            ],
          ),

          // CTA Button
          const FullWidthButton(),
        ],
      ),
    );
  }
}
