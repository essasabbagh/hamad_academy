import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/enums/roles.dart';
import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';

import 'widgets/parent_bottom_nav_bar.dart';
import 'widgets/student_bottom_nav_bar.dart';
import 'widgets/supervisor_bottom_nav_bar.dart';
import 'widgets/teacher_bottom_nav_bar.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key, required this.child});

  final Widget child;

  Widget _buildBottomNavigationBar() {
    final role = getCurrentRole();
    return switch (role) {
      UserRole.student => const StudentBottomNavBar(),
      UserRole.parent => const ParentBottomNavBar(),
      UserRole.teacher => const TeacherBottomNavBar(),
      UserRole.supervisor => const SupervisorBottomNavBar(),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(routerProvider).location;

    // Check if the current location starts with any of the hide routes paths
    final showNavBar = !_hideNavBarRoutes.any((route) {
      // Extract just the base path without the parameter part
      final basePath = route.path.split('/:').first;
      return location.startsWith(basePath);
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: showNavBar ? _buildBottomNavigationBar() : null,
    );
  }
}

// Routes where we want to hide the bottom nav bar using the enum
final List<AppRoutes> _hideNavBarRoutes = [
  // AppRoutes.profile,
  // Add other routes where you want to hide the nav bar
];
