import 'package:flutter/material.dart';

import 'package:hamad/components/course/expandable_widget.dart';
import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../models/lesson_data.dart';

class ExpandableLessonWidget extends StatelessWidget {
  const ExpandableLessonWidget({
    super.key,
    required this.lessonData,
  });

  final LessonData lessonData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        final cardPadding = isTablet ? 24.0 : 16.0;
        final titleFontSize = isTablet ? 20.0 : 18.0;

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isTablet ? 16.0 : 12.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ExpandableWidget(
            header: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SvgAsset(
                    AppImages.iconsPlay,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      lessonData.title,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 42,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                cardPadding,
                0,
                cardPadding,
                cardPadding,
              ),
              child: const Column(
                children: [
                  _LessonDetail(
                    title: 'درس 1',
                    subtitle: '3 فيديو - 25 دقيقة',
                  ),
                  _LessonDetail(
                    title: 'درس 2',
                    subtitle: '3 فيديو - 25 دقيقة',
                  ),
                  _LessonDetail(
                    title: 'درس 3',
                    subtitle: '3 فيديو - 25 دقيقة',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LessonDetail extends StatelessWidget {
  const _LessonDetail({
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const SvgAsset(
        AppImages.iconsDoneOutline,
        color: AppColors.success600,
        width: 24,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
