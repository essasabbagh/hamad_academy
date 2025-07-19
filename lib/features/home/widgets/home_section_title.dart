import 'package:flutter/material.dart';
import 'package:hamad/core/themes/app_styles.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: AppStyles.headingTextStyle,
        ),
      ),
    );
  }
}
