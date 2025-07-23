import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/components/ui/percent_indicator.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/shadows.dart';

class LessonProgressCard extends StatelessWidget {
  const LessonProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: baseBoxShadow,
      ),
      child: const Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '3 من 12 درس مكتمل',
              style: TextStyle(
                //
              ),
            ),
          ),
          SizedBox(height: 8),
          PercentIndicator(
            progress: 0.8,
            // progressColor: AppColors.primary700,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgAsset(
                AppImages.iconsPlay,
                color: AppColors.primary700,
                width: 42,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أكمل الدراسة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'درس الجمع والطرح',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
