import 'package:flutter/material.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../models/feature_model.dart';

import 'feature_card.dart';

final List<FeatureModel> features = <FeatureModel>[
  FeatureModel(
    icon: AppImages.iconsQuickReview,
    color: AppColors.color2,
    backgroundColor: AppColors.color2Background,
    label: 'زبدة الدورة',
    route: AppRoutes.about.name,
  ),
  FeatureModel(
    icon: AppImages.iconsNotes,
    color: AppColors.primary700,
    backgroundColor: AppColors.primary25,
    label: 'الملاحظات',
    route: AppRoutes.about.name,
  ),
  FeatureModel(
    icon: AppImages.iconsSummary,
    color: AppColors.accent600,
    backgroundColor: AppColors.accent25,
    label: 'الملخصات',
    route: AppRoutes.about.name,
  ),
  FeatureModel(
    icon: AppImages.iconsHomework,
    color: AppColors.success700,
    backgroundColor: AppColors.successAlpha,
    label: 'وظائف',
    route: AppRoutes.about.name,
  ),
  FeatureModel(
    icon: AppImages.iconsQa,
    color: AppColors.blue,
    backgroundColor: AppColors.blueBackground,
    label: 'سؤال وجواب',
    route: AppRoutes.about.name,
  ),
  FeatureModel(
    icon: AppImages.iconsExams,
    color: AppColors.primary700,
    backgroundColor: AppColors.primary50,
    label: 'اختبارات',
    route: AppRoutes.about.name,
  ),
];

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = features[index];
        return FeatureCard(item: item);
      },
    );
  }
}
