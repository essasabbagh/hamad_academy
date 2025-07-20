import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/themes/app_colors.dart';

import '../providers/supervisor_root_notifier.dart';

class SupervisorBottomNavBar extends ConsumerWidget {
  const SupervisorBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(supervisorRootProvider);
    final state = ref.read(supervisorRootProvider.notifier);

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
              AppImages.iconsBottombarCreditCard,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconsBottombarCreditCardFill,
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
