import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/router/app_router.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/core/router/go_router_extension.dart';

// Define a mapping between AppRoutes enum values and tab indices
final Map<AppRoutes, int> studentRouteToIndexMap = {
  AppRoutes.parentHome: 0,
  AppRoutes.parentCourses: 1,
  AppRoutes.parentCalendar: 2,
  AppRoutes.parentPayments: 3,
  AppRoutes.profile: 4,
};

// StudentRootNotifier class
class ParentRootNotifier extends StateNotifier<int> {
  ParentRootNotifier(this.ref) : super(0) {
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
final parentRootProvider = StateNotifierProvider<ParentRootNotifier, int>(
  ParentRootNotifier.new,
);

/* 

class ParentRootNotifier extends Notifier<int> {
  @override
  build() => getIndex();

  // reset
  void reset() {
    state = 0;
  }

  // Add this method to update the index without navigation
  void updateIndex() {
    state = getIndex();
  }

  void onTap(int index) {
    if (index == state) return;

    final router = ref.watch(routerProvider);

    state = index;
    switch (index) {
      case 0:
        router.goNamed(AppRoutes.parentHome.name);
        break;
      case 1:
        router.pushNamed(AppRoutes.notifications.name);
        break;
      case 2:
        router.pushNamed(AppRoutes.settings.name);
        break;
      case 3:
        router.pushNamed(AppRoutes.profile.name);
        break;
    }
  }

  int getIndex() {
    final location = ref.watch(routerProvider).location;

    if (location.contains(AppRoutes.parentHome.name)) {
      return 0;
    } else if (location.contains(AppRoutes.notifications.name)) {
      return 1;
    } else if (location.contains(AppRoutes.settings.name)) {
      return 2;
    } else if (location.contains(AppRoutes.profile.name)) {
      return 3;
    } else {
      return 0;
    }
  }
}
 */