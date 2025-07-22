import 'package:flutter/material.dart';

class FeatureModel {
  FeatureModel({
    required this.route,
    required this.icon,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  final String route;
  final String icon;
  final String label;
  final Color color;
  final Color backgroundColor;
}
