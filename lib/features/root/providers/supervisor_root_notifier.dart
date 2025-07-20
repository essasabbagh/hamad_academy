import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';

// Define a mapping between AppRoutes enum values and tab indices
final Map<AppRoutes, int> supervisorRouteToIndexMap = {
  AppRoutes.supervisorHome: 0,
  AppRoutes.supervisorCourses: 1,
  AppRoutes.supervisorPepole: 2,
  AppRoutes.supervisorCalendar: 3,
  AppRoutes.profile: 4,
};

// StudentRootNotifier class
class SupervisorRootNotifier extends StateNotifier<int> {
  SupervisorRootNotifier(this.ref) : super(0) {
    // Listen to router changes
    ref.listen(routerProvider, (_, router) {
      _updateIndexFromRoute(router.location);
    });
  }

  final Ref ref;

  void _updateIndexFromRoute(String currentLocation) {
    // Find matching route in our map
    for (final entry in supervisorRouteToIndexMap.entries) {
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
    final route = supervisorRouteToIndexMap.entries
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
final supervisorRootProvider =
    StateNotifierProvider<SupervisorRootNotifier, int>(
      SupervisorRootNotifier.new,
    );
