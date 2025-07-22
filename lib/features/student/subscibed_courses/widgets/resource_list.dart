import 'package:flutter/material.dart';

import 'package:hamad/components/ui/section_title.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/utils/snackbars.dart';

import 'resource_item.dart';

class ResourceList extends StatelessWidget {
  const ResourceList({super.key});

  final resources = const ['الجمع والطرح', 'الجمع والطرح'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).sources,
          trailingWidget: TextButton(
            onPressed: () {
              AppSnackBar.info('Show all resources');
            },
            child: Text(
              S.of(context).showAll,
              style: const TextStyle(
                color: AppColors.color2,
              ),
            ),
          ),
        ),
        ListView.separated(
          itemCount: resources.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) => ResourceItem(
            title: resources[index],
          ),
        ),
      ],
    );
  }
}
