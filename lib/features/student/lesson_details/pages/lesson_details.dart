import 'package:flutter/material.dart';

import 'package:hamad/components/course/course_bookmark_btn.dart';
import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/components/lesson/lesson_item.dart';
import 'package:hamad/components/main/logo.dart';
import 'package:hamad/components/main/main_appbar.dart';
import 'package:hamad/components/ui/base_container.dart';
import 'package:hamad/components/ui/feature_grid.dart';
import 'package:hamad/components/ui/percent_indicator.dart';
import 'package:hamad/components/ui/section_title.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/themes/app_colors.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: Logo(
          width: 120,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PercentIndicator(
                  progress: 0.75,
                  progressColor: AppColors.primary700,
                ),
                SizedBox(height: 16),
                Text('أكملت 2 من 3 أجزاء من هذا الدرس'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BaseContainer(
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'الجمع والطرح',
                    trailingWidget: CourseBookmarkBtn(),
                  ),
                  LessonItem(
                    onTap: () {
                      // context.pushNamed(
                      //   AppRoutes.studentsubscribedLessonDetails.name,
                      //   pathParameters: {
                      //     'lessonId': '1',
                      //   },
                      // );
                    },
                    title: 'درس 3',
                    subtitle: '3 فيديو - 25 دقيقة',
                    isCompleted: true,
                    leading: const SvgAsset(
                      AppImages.iconsPlay,
                      color: AppColors.blackColor,
                      width: 38,
                    ),
                  ),
                  const LessonItem(
                    title: 'درس 3',
                    subtitle: '3 فيديو - 25 دقيقة',
                    isCompleted: true,
                    leading: SvgAsset(
                      AppImages.iconsPlay,
                      color: AppColors.blackColor,
                      width: 38,
                    ),
                  ),
                  const LessonItem(
                    title: 'تمرين تفاعلي',
                    subtitle: '3 فيديو - 25 دقيقة',
                    leading: SvgAsset(
                      AppImages.iconsPlay,
                      color: AppColors.blackColor,
                      width: 38,
                    ),
                  ),
                  const LessonItem(
                    title: 'ملخص الدرس',
                    subtitle: '3 فيديو - 25 دقيقة',
                    leading: SvgAsset(
                      AppImages.iconsFilePdf,
                      color: AppColors.blackColor,
                      width: 38,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeatureGrid(
              features: _features,
            ),
          ),
        ],
      ),
    );
  }
}

final List<FeatureModel> _features = <FeatureModel>[
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
    icon: AppImages.iconsAsk,
    color: AppColors.accent600,
    backgroundColor: AppColors.accent25,
    label: 'اسأل المعلم',
    route: AppRoutes.about.name,
  ),
];
