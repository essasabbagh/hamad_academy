import 'package:flutter/material.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/utils/snackbars.dart';

class CourseBookmarkBtn extends StatelessWidget {
  const CourseBookmarkBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppSnackBar.info('bookmark');
      },
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.bookmark_border_rounded),
      ),
    );
  }
}
