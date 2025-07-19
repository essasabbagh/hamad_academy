import 'package:flutter/material.dart';

import 'package:hamad/core/themes/app_colors.dart';

class SessionActionButton extends StatelessWidget {
  const SessionActionButton({
    super.key,
    this.color,
    required this.title,
  });

  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
