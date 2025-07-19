import 'package:flutter/material.dart';

import 'app_colors.dart';

final List<BoxShadow> baseBoxShadow = [
  BoxShadow(
    color: AppColors.shadowColor.withValues(alpha: .08),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
];
