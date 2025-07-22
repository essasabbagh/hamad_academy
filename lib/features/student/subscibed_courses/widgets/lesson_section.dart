import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/app_styles.dart';
import 'package:hamad/core/utils/snackbars.dart';

import 'section_title.dart';

class LessonSection extends StatelessWidget {
  const LessonSection({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'الدروس (20)',
        ),
        ...children,
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                // Handle see more action
                AppSnackBar.info('Lesson Section');
              },
              icon: const SvgAsset(
                AppImages.iconsSeemore,
                color: AppColors.primary700,
                width: 24,
              ),
              label: Text(
                S.of(context).seeMore,
                style: AppStyles.largeHeadingTextStyle.copyWith(
                  color: AppColors.primary700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
