import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/themes/app_styles.dart';
import 'package:hamad/features/courses/widgets/course_card.dart';
import 'package:hamad/features/courses/widgets/course_category_tab.dart';
import 'package:hamad/features/courses/widgets/empty_courses.dart';
import 'package:hamad/features/home/widgets/person_dropdown.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 120 + 24,
        title: Text(
          S.of(context).myChildsCourses,
          style: AppStyles.headingTextStyle,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PersonDropdown(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorWeight: 0,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          automaticIndicatorColorAdjustment: true,
          indicator: const BoxDecoration(
            color: Colors.transparent,
          ),
          labelPadding: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          tabs: [
            CourseCategoryTab(
              title: 'دورات التأسيس',
              isSelected: _tabController.index == 0,
            ),
            CourseCategoryTab(
              title: 'دورات المنهاج',
              isSelected: _tabController.index == 1,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Foundation Courses Tab
          ListView(
            children: [
              CourseCard(
                title: 'الرياضيات',
                date: '12 مايو 2025',
                description: 'الرياضيات الممتعة مع المعلمة روان',
                sessionsCompleted: 2,
                totalSessions: 3,
                imageUrl: AppImages.imagesProductImage,
                onTap: () {
                  context.pushNamed(
                    AppRoutes.courseDetails.name,
                    pathParameters: {
                      'id': '1',
                    },
                  );
                },
              ),
              CourseCard(
                title: 'الرياضيات',
                date: '12 مايو 2025',
                description: 'الرياضيات الممتعة مع المعلمة روان',
                sessionsCompleted: 1,
                totalSessions: 4,
                imageUrl: AppImages.imagesProductImage,
                onTap: () {
                  context.pushNamed(
                    AppRoutes.courseDetails.name,
                    pathParameters: {
                      'id': '1',
                    },
                  );
                },
              ),
              CourseCard(
                title: 'لغة عربية',
                date: '12 مايو 2025',
                description: 'الرياضيات الممتعة مع المعلمة روان',
                sessionsCompleted: 2,
                totalSessions: 3,
                imageUrl: AppImages.imagesProductImage,
                onTap: () {
                  context.pushNamed(
                    AppRoutes.courseDetails.name,
                    pathParameters: {
                      'id': '1',
                    },
                  );
                },
              ),
            ],
          ),
          const EmptyCourses(),

          // Curriculum Courses Tab
          // ListView(
          //   padding: const EdgeInsets.all(16),
          //   children: [
          //     // Add curriculum courses here
          //     const Center(child: Text('لا توجد دورات منهاج متاحة حالياً')),
          //   ],
          // ),
        ],
      ),
    );
  }
}
