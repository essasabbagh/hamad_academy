import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/components/main/logo.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_styles.dart';

import 'models/course_data.dart';
import 'widgets/badge_icon_widget.dart';
import 'widgets/expandable_widget.dart';
import 'widgets/home_section_title.dart';
import 'widgets/person_dropdown.dart';
import 'widgets/reminder_carousel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 120 + 24,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Logo(width: 120),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PersonDropdown(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Logo(width: 120),
              //       PersonDropdown(),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحبًا، أ. عبد الرحيم 👋',
                          style: AppStyles.titleStyle,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'نتمنى لك يوماً سعيداً',
                          style: AppStyles.bodyTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BadgeIconWidget(
                          count: 3,
                          icon: SvgPicture.asset(AppImages.iconsChatCentered),
                        ),
                        const SizedBox(width: 12),
                        BadgeIconWidget(
                          count: 3,
                          icon: SvgPicture.asset(AppImages.iconsBell),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // reminder
              const HomeSectionTitle(
                title: 'تذكير',
              ),
              const ReminderCarousel(),
              const HomeSectionTitle(
                title: 'التزام الطفل',
              ),
              ExpandableCourseWidget(
                courseData: CourseData(
                  title: 'دورة الرياضيات الأساسية',
                  iconPath: 'https://picsum.photos/250',
                  totalSessions: 8,
                  completedSessions: 2,
                  missedSessions: 3,
                  totalJobs: 4,
                  completedJobs: 3,
                  missedJobs: 1,
                  totalEvaluations: 8,
                  positiveEvaluations: 4,
                  negativeEvaluations: 2,
                  commitmentPercentage: 87,
                  motivationalMessage: 'رائع! طفلك ملتزم جداً',
                ),
              ),
              const SizedBox(height: 16),
              ExpandableCourseWidget(
                courseData: CourseData(
                  title: 'دورة اللغة العربية',
                  iconPath: 'https://picsum.photos/200',
                  totalSessions: 8,
                  completedSessions: 2,
                  missedSessions: 2,
                  totalJobs: 4,
                  completedJobs: 3,
                  missedJobs: 1,
                  totalEvaluations: 8,
                  positiveEvaluations: 4,
                  negativeEvaluations: 2,
                  commitmentPercentage: 44,
                  motivationalMessage:
                      'نسبة الالتزام في هذه المادة أقل من 70%. ننصح بمتابعة طفلك أو التواصل مع المعلم.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
