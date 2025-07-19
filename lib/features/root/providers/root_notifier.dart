import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';

// Define a mapping between AppRoutes enum values and tab indices
final Map<AppRoutes, int> routeToIndexMap = {
  AppRoutes.home: 0,
  AppRoutes.courses: 1,
  AppRoutes.search: 2,
  AppRoutes.notifications: 3,
  AppRoutes.profile: 4,
};

final rootProvider = StateNotifierProvider<RootNotifier, int>(
  RootNotifier.new,
);

class RootNotifier extends StateNotifier<int> {
  RootNotifier(this.ref) : super(0) {
    // Listen to router changes
    ref.listen(routerProvider, (_, router) {
      _updateIndexFromRoute(router.location);
    });
  }

  final Ref ref;

  void _updateIndexFromRoute(String currentLocation) {
    // Find matching route in our map
    for (final entry in routeToIndexMap.entries) {
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
    final route = routeToIndexMap.entries
        .firstWhere(
          (entry) => entry.value == index,
          orElse: () => const MapEntry(AppRoutes.home, 0),
        )
        .key;

    // Navigate using the enum value
    ref.read(routerProvider).go(route.path);
  }
}
