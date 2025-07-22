import 'package:flutter/material.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/enums/session_status.dart';
import 'package:hamad/core/extensions/context_ext.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/features/courses/widgets/course_details_section.dart';
import 'package:hamad/features/courses/widgets/session_card.dart';

import '../../../components/course/course_details_header.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> tabs = [
    'الجلسات',
    'المصادر',
    'الاختبارات',
    'الملاحظات',
    'الوظائف',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const SizedBox(),
              pinned: true,
              expandedHeight: context.height * .75,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    const SizedBox(height: kToolbarHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButton(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.imagesLogo,
                            height: kToolbarHeight - 16,
                          ),
                        ),
                        const BackButton(
                          onPressed: null,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    const CourseDetailsHeader(),
                    const CourseDetailsSection(),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TabBar(
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
                    labelPadding: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    tabs: tabs.map(
                      (title) {
                        int index = tabs.indexOf(title);
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _tabController.index == index
                                ? AppColors.primary700
                                : null,
                            border: Border.all(
                              color: _tabController.index == index
                                  ? Colors.transparent
                                  : AppColors.primary100,
                            ),
                          ),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: _tabController.index == index
                                  ? AppColors.white
                                  : null,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildSessionsTab(),
              _buildSourcesTab(),
              _buildExamsTab(),
              _buildNotesTab(),
              _buildAssignmentsTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSessionsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SessionCard(
          title: ' الجلسة 4: ألعاب على الكسور',
          dateText: 'الآن',
          timeText: 'مباشرة الآن ، الساعة 5:00 م',
          status: SessionStatus.liveNow,
        ),
        const SessionCard(
          title: ' الجلسة 4: ألعاب على الكسور',
          dateText: 'الإثنين 13 مايو ',
          timeText: 'غبت عنها ، غياب مبرر',
          status: SessionStatus.liveToday,
        ),
        const SessionCard(
          title: 'الجلسة 3: الكسور الممتعة',
          dateText: 'الأحد 19 مايو',
          timeText: 'الساعة 5:00 م',
          status: SessionStatus.upcoming,
        ),
        const SessionCard(
          title: 'الجلسة 2: مراجعة الكسور ',
          dateText: 'الإثنين 13 مايو',
          timeText: 'مباشرة الآن ، الساعة 5:00 م',
          status: SessionStatus.attended,
        ),
        const SessionCard(
          title: ' الجلسة 4: ألعاب على الكسور',
          dateText: 'الإثنين 13 مايو ',
          timeText: 'غبت عنها ، غياب مبرر',
          status: SessionStatus.excusedAbsence,
        ),
        const SessionCard(
          title: ' الجلسة 4: ألعاب على الكسور',
          dateText: 'الإثنين 13 مايو ',
          timeText: 'غبت عنها ، غياب مبرر',
          status: SessionStatus.unjustifiedAbsence,
        ),
      ],
    );
  }

  Widget _buildSourcesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('item $index'),
        );
      },
    );
  }

  Widget _buildExamsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('item $index'),
        );
      },
    );
  }

  Widget _buildNotesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('item $index'),
        );
      },
    );
  }

  Widget _buildAssignmentsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('item $index'),
        );
      },
    );
  }
}
