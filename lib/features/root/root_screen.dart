import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/constants/images.dart';
import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';
import 'package:hamad/core/themes/app_colors.dart';
import 'package:hamad/features/root/providers/root_notifier.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(rootProvider);
    final state = ref.read(rootProvider.notifier);

    final location = ref.watch(routerProvider).location;

    // Check if the current location starts with any of the hide routes paths
    final showNavBar = !_hideNavBarRoutes.any((route) {
      // Extract just the base path without the parameter part
      final basePath = route.path.split('/:').first;
      return location.startsWith(basePath);
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: showNavBar
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.surfaceColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
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
                    label: 'Home',
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
                type: BottomNavigationBarType.fixed,
              ),
            )
          : null,
    );
  }
}

// Routes where we want to hide the bottom nav bar using the enum
final List<AppRoutes> _hideNavBarRoutes = [
  // AppRoutes.profile,
  // Add other routes where you want to hide the nav bar
];
