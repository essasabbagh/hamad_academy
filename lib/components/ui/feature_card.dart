import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/components/ui/feature_grid.dart';
import 'package:hamad/core/extensions/extensions.dart';
import 'package:hamad/core/router/app_routes.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.item,
  });

  final FeatureModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => context.pushNamed(item.route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: SvgAsset(
                item.icon,
                color: null,
                width: context.isTablet ? 64 : 48,
              ),
            ),
            Text(
              item.label,
              style: TextStyle(fontSize: 16, color: item.color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
