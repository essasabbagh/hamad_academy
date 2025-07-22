import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/utils/snackbars.dart';

class ResourceItem extends StatelessWidget {
  const ResourceItem({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // Handle resource item tap
        AppSnackBar.info('Tapped on resource: $title');
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: .08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          // leading: Image.asset(AppImages.imagesFileTypesFilePdf, width: 24),
          leading: const SvgAsset(
            AppImages.iconsFilePdf,
            color: AppColors.blackColor,
            width: 24,
          ),
          title: Text(title),
          trailing: const Icon(
            Icons.file_download_outlined,
            color: AppColors.primary700,
          ),
        ),
      ),
    );
  }
}
