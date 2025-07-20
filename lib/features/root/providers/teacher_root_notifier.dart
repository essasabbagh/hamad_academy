import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';

final Map<AppRoutes, int> studentRouteToIndexMap = {
  AppRoutes.teacherHome: 0,
  AppRoutes.teacherCalendar: 1,
  AppRoutes.teacherCourses: 2,
  AppRoutes.profile: 3,
};

class TeacherRootNotifier extends StateNotifier<int> {
  TeacherRootNotifier(this.ref) : super(0) {
    // Listen to router changes
    ref.listen(routerProvider, (_, router) {
      _updateIndexFromRoute(router.location);
    });
  }

  final Ref ref;

  void _updateIndexFromRoute(String currentLocation) {
    // Find matching route in our map
    for (final entry in studentRouteToIndexMap.entries) {
      // Get the base path from the enum
      final routePath = entry.key.path;

      if (currentLocation.startsWith(routePath)) {
        state = entry.value;
        return;
      }
    }
    // No match found, keep current state
  }

  void onTap(int index) {
    state = index;

    // Find the route corresponding to this index
    final route = studentRouteToIndexMap.entries
        .firstWhere(
          (entry) => entry.value == index,
          orElse: () => const MapEntry(AppRoutes.studentHome, 0),
        )
        .key;

    // Navigate using the enum value
    ref.read(routerProvider).go(route.path);
  }
}

// Provider definition
final teacherRootProvider = StateNotifierProvider<TeacherRootNotifier, int>(
  TeacherRootNotifier.new,
);
