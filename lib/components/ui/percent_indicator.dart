import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:hamad/core/extensions/extensions.dart';
import 'package:hamad/core/themes/app_colors.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    super.key,
    required this.progress,
    this.progressColor,
  });

  final double progress;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      // restartAnimation: true,
      // animationDuration: 500,
      // animateToInitialPercent: true,
      percent: progress,
      lineHeight: 8.0,
      isRTL: context.isRtl,
      padding: EdgeInsets.zero,
      barRadius: const Radius.circular(4),
      progressColor: progressColor ?? AppColors.primary700,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
