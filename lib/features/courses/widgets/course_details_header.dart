import 'package:flutter/material.dart';

import 'package:hamad/components/images/avatar_widget.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/extensions/context_ext.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_gradients.dart';
import 'package:hamad/core/themes/app_styles.dart';

class CourseDetailsHeader extends StatelessWidget {
  const CourseDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Image.asset(
            AppImages.imagesProductImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradient.imageOverlayGradient,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const AvatarWidget(
                      'https://i.pravatar.cc/300',
                      size: 38,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'أ.روان عبد ربه',
                      style: AppStyles.titleStyle.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  'مادة الرياضيات – مع المعلمة روان  ',
                  style: AppStyles.headingTextStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'اشتراك ساري حتى: 30 مايو 2025',
                  style: AppStyles.bodyTextStyle.copyWith(
                    color: AppColors.white,
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
