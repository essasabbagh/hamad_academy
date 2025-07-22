import 'package:flutter/material.dart';

import 'package:hamad/components/course/course_bookmark_btn.dart';
import 'package:hamad/components/course/course_details_header.dart';
import 'package:hamad/components/main/logo.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../../../../components/ui/feature_grid.dart';
import '../models/lesson_data.dart';
import '../widgets/expandable_lesson_widget.dart';
import '../widgets/lesson_progress_card.dart';
import '../widgets/lesson_section.dart';
import '../widgets/resource_list.dart';

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

class SuscribedCoursesScreen extends StatelessWidget {
  const SuscribedCoursesScreen({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const BackButton(),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Logo(width: 120),
        ),
        actions: [
          const CourseBookmarkBtn(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CourseDetailsHeader(),
              const SizedBox(height: 16),
              FeatureGrid(
                features: _features,
              ),
              const SizedBox(height: 16),
              const LessonProgressCard(),
              LessonSection(
                children: [
                  ExpandableLessonWidget(
                    lessonData: LessonData(
                      title: 'الجمع والطرح',
                    ),
                  ),
                  ExpandableLessonWidget(
                    lessonData: LessonData(
                      title: 'المعادلات الخطية',
                    ),
                  ),
                  ExpandableLessonWidget(
                    lessonData: LessonData(
                      title: 'التناسب والتناسب العكسي',
                    ),
                  ),
                ],
              ),
              const ResourceList(),
            ],
          ),
        ),
      ),
    );
  }
}
