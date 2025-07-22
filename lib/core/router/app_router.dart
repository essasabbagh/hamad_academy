import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_transitions/go_transitions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hamad/core/data/storage_service.dart';
import 'package:hamad/core/enums/roles.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/features/auth/providers/auth_provider.dart';
import 'package:hamad/features/statics/not_found.dart';
import 'package:hamad/initialize_app.dart';

import 'app_route_path_cache.dart';
import 'app_routes.dart';
import 'go_router_observer.dart';
import 'routes.dart';

String getHomePath() {
  final role = getCurrentRole();

  return switch (role) {
    UserRole.student => AppRoutes.studentHome.path,
    UserRole.teacher => AppRoutes.teacherHome.path,
    UserRole.parent => AppRoutes.parentHome.path,
    UserRole.supervisor => AppRoutes.supervisorHome.path,
  };
}

final routerProvider = Provider<GoRouter>((ref) {
  // Initialize full path cache
  AppRoutePathCache.instance.init(routes);

  // final firebaseAnalyticsObserver = ref.watch(
  //   firebaseAnalyticsObserverProvider,
  // );

  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    // update the listenable, when some provider value changes
    // here, we are just interested in wheter the user's logged in
    ..listen(
      authNotifierProvider.select(
        (AsyncValue<bool> val) => val.whenData((val) => val),
      ),
      (_, AsyncValue<bool> next) {
        isAuth.value = next;
      },
    );

  /// Set default transition values for the entire app.
  GoTransition.defaultCurve = Curves.easeInOut;
  GoTransition.defaultDuration = const Duration(milliseconds: 500);

  final router = GoRouter(
    routes: routes,
    refreshListenable: isAuth,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splash.path,
    errorBuilder: (context, state) => const NotFoundScreen(),
    observers: [
      // Add your navigator observers
      GoRouterObserver(),
      // firebaseAnalyticsObserver,
      GoTransition.observer,
    ],
    // onException: (context, state, router) {
    //   AppLogs.error('GoRouter onException: ${state.error}', 'AppRoutes');
    // },
    redirect: (context, state) {
      final storage = locator<StorageService>();

      final isOnboardingCompleted = true;
      // final isOnboardingCompleted = storage.readBool(onboardingKey);

      // Extract the current path
      final currentPath = state.uri.path;

      // Allowed paths for unauthenticated users
      final allowedUnauthPaths = [
        // AppRoutes.splash.path,
        AppRoutes.onboarding.path,
        AppRoutes.login.path,
      ];

      // 1. Show splash screen if auth state is loading or not available
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return AppRoutes.splash.path;
      }

      // 2. Go to onboarding screen if not completed
      if (!isOnboardingCompleted) {
        return AppRoutes.onboarding.path;
      }

      // 3. Authenticated user logic
      if (isAuth.value.requireValue) {
        if (currentPath == AppRoutes.splash.path) {
          return getHomePath();
        }
      }

      // 4. Unauthenticated user logic
      if (!isAuth.value.requireValue) {
        // Allow unauthenticated users to access their allowed paths
        if (allowedUnauthPaths.contains(currentPath)) {
          return null; // Stay on the requested path
        }
        // Redirect to login if accessing an invalid path
        return AppRoutes.login.path;
      }

      // 5. Allow navigation to register, reset password, or login if auth false
      if (isAuth.value.requireValue &&
          allowedUnauthPaths.contains(currentPath)) {
        return getHomePath();
      }

      // 6. Allow navigation to register, reset password, or login if auth false
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
});

final routeInformationProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>(
      (ref) => ref.watch(routerProvider).routeInformationProvider,
    );
