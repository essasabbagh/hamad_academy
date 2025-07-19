import 'package:flutter/widgets.dart';

import 'package:hamad/core/themes/app_colors.dart';

class AppStyles {
  AppStyles._();

  static const TextStyle headingTextStyle = TextStyle(
    // fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    height: 1.5,
    letterSpacing: 0.0,
    // color: AppColors.primary500,
  );

  static const TextStyle titleStyle = TextStyle(
    // fontFamily: 'Almarai',
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.0,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    // fontFamily: 'Almarai',
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
    height: 1.5,
    letterSpacing: 0.0,
  );

  static const TextStyle largeHeadingTextStyle = TextStyle(
    // fontFamily: 'Almarai', // Ensure 'Almarai' font is added to pubspec.yaml
    fontWeight: FontWeight.w700, // Corresponds to Bold (700)
    fontSize: 16.0, // Font size in logical pixels
    height: 1.5, // Line height as a multiplier (150% of font size)
    letterSpacing: 0.0, // Letter spacing in logical pixels
    // color: Colors.black, // You might want to define a default color here
  );
}
