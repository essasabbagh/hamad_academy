import 'package:flutter/material.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/themes/app_styles.dart';

class EmptyCourses extends StatelessWidget {
  const EmptyCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.imagesEmptyImagesLightBook),
            const SizedBox(height: 32),
            Text(
              S.of(context).yourChildHasNotYetRegisteredForAnyCoursesYou,
              style: AppStyles.largeHeadingTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
