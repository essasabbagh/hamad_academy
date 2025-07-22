import 'package:flutter/material.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.titleFontSize,
    required this.isTablet,
  });

  final String title;
  final String iconUrl;
  final double titleFontSize;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: isTablet ? 48 : 40,
          height: isTablet ? 48 : 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image(image: NetworkImage(iconUrl)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.keyboard_arrow_down_rounded, size: 42),
      ],
    );
  }
}
