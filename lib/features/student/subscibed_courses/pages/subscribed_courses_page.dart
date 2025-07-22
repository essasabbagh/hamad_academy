import 'package:flutter/material.dart';

import 'package:hamad/components/course/course_bookmark_btn.dart';
import 'package:hamad/components/course/course_details_header.dart';
import 'package:hamad/components/main/logo.dart';

import '../models/lesson_data.dart';
import '../widgets/expandable_lesson_widget.dart';
import '../widgets/feature_grid.dart';
import '../widgets/lesson_progress_card.dart';
import '../widgets/lesson_section.dart';
import '../widgets/resource_list.dart';

class SuscribedCoursesScreen extends StatelessWidget {
  const SuscribedCoursesScreen({super.key});

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
              const FeatureGrid(),
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
