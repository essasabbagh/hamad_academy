import 'package:flutter/material.dart';

import 'feature_card.dart';

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

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({
    super.key,
    required this.features,
  });

  final List<FeatureModel> features;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = features[index];
        return FeatureCard(item: item);
      },
    );
  }
}
