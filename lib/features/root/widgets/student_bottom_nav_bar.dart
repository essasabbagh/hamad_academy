import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../providers/student_root_notifier.dart';

class StudentBottomNavBar extends ConsumerWidget {
  const StudentBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(studentRootProvider);
    final state = ref.read(studentRootProvider.notifier);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surfaceColor,
        currentIndex: index,
        onTap: state.onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.iconsBottombarHouse,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconsBottombarHouseFill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.iconsBottombarBookOpenText,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconsBottombarBookOpenTextFill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.iconsBottombarCalendar,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconsBottombarCalendarFill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.iconsBottombarUserCircle,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconsBottombarUserCircleFill,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
