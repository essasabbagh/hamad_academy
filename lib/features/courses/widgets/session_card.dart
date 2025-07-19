import 'package:flutter/material.dart';

import 'package:hamad/components/images/svg_asset.dart';
import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/enums/session_status.dart';
import 'package:hamad/core/extensions/context_ext.dart';
import 'package:hamad/core/locale/generated/l10n.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/core/themes/shadows.dart';

import 'session_action_button.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.title,
    required this.dateText,
    required this.timeText,
    required this.status,
  });
  final String title;
  final String dateText;
  final String timeText;
  final SessionStatus status;

  Widget getStatusWidget() {
    switch (status) {
      case SessionStatus.liveNow:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent700.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgAsset(
                AppImages.iconsClock,
                width: 24,
                color: AppColors.accent700,
              ),
              const SizedBox(width: 4),
              Text(
                timeText,
                style: const TextStyle(
                  color: AppColors.accent700,
                ),
              ),
            ],
          ),
        );
      case SessionStatus.upcoming:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.success600.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgAsset(
                AppImages.iconsClock,
                width: 24,
                color: AppColors.success600,
              ),
              const SizedBox(width: 4),
              Text(
                timeText,
                style: const TextStyle(
                  color: AppColors.success600,
                ),
              ),
            ],
          ),
        );
      case SessionStatus.attended:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.blue.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgAsset(
                AppImages.iconsDoneOutline,
                width: 18,
                color: AppColors.blue,
              ),
              SizedBox(width: 4),
              Text(
                'تم الحضور',
                style: TextStyle(
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        );
      case SessionStatus.excusedAbsence:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgAsset(
                AppImages.iconsClose,
                width: 24,
                color: AppColors.error600,
              ),
              SizedBox(width: 4),
              Text(
                'غبت عنها ، غياب مبرر',
                style: TextStyle(
                  color: AppColors.error600,
                ),
              ),
            ],
          ),
        );
      case SessionStatus.unjustifiedAbsence:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgAsset(
                AppImages.iconsClose,
                width: 24,
                color: AppColors.error600,
              ),
              SizedBox(width: 4),
              Text(
                'غبت عنها ، غياب غير مبرر',
                style: TextStyle(
                  color: AppColors.error600,
                ),
              ),
            ],
          ),
        );
      case SessionStatus.liveToday:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent700.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgAsset(
                AppImages.iconsClock,
                width: 24,
                color: AppColors.accent700,
              ),
              const SizedBox(width: 4),
              Text(
                timeText,
                style: const TextStyle(
                  color: AppColors.accent700,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget getStatusActions() {
    switch (status) {
      case SessionStatus.liveNow:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SessionActionButton(
                title: S.current.joinNow,
                color: AppColors.success600,
              ),
              const SizedBox(width: 16),
              SessionActionButton(
                title: S.current.reschedule,
                color: AppColors.color2,
              ),
            ],
          ),
        );

      case SessionStatus.liveToday:
      case SessionStatus.upcoming:
      case SessionStatus.attended:
      case SessionStatus.excusedAbsence:
      case SessionStatus.unjustifiedAbsence:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SessionActionButton(
                title: S.current.joinNow,
                color: AppColors.success600,
              ),
              const SizedBox(width: 16),
              SessionActionButton(
                title: S.current.reschedule,
                color: AppColors.color2,
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: baseBoxShadow,
      ),
      child: ExpansionTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SvgAsset(
                    AppImages.iconsLive,
                    width: 32,
                    color: AppColors.primary700,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.isTablet ? 16 : 12,
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.isTablet ? 20 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  getStatusWidget(),
                ],
              ),
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.all(16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'خطة الجلسة :',
              style: TextStyle(
                fontSize: context.isTablet ? 20 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '1. مقدمة عن الكسور',
                style: TextStyle(
                  fontSize: context.isTablet ? 20 : 16,
                ),
              ),
              Text(
                '2. نشاط حسابي تفاعلي ',
                style: TextStyle(
                  fontSize: context.isTablet ? 20 : 16,
                ),
              ),
              Text(
                '3. لعب وتمثيل الكسور',
                style: TextStyle(
                  fontSize: context.isTablet ? 20 : 16,
                ),
              ),
              Text(
                '4. مراجعة واختبار بسيط',
                style: TextStyle(
                  fontSize: context.isTablet ? 20 : 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          getStatusActions(),
        ],
      ),
    );
  }
}
