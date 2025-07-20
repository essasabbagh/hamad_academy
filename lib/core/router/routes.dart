import 'package:flutter/material.dart';

import 'package:hamad/components/web/web.dart';
import 'package:hamad/core/errors/error_handler_usage_examples.dart';
import 'package:hamad/core/keys/keys.dart';
import 'package:hamad/core/log/app_log.dart';
import 'package:hamad/core/router/app_routes.dart';
import 'package:hamad/features/auth/pages/login_screen.dart';
import 'package:hamad/features/auth/pages/password_reset_screen.dart';
import 'package:hamad/features/auth/pages/register_screen.dart';
import 'package:hamad/features/courses/pages/course_details_page.dart';
import 'package:hamad/features/courses/pages/courses_page.dart';
// import 'package:hamad/features/category/category_screen.dart';
import 'package:hamad/features/help/pages/help_screen.dart';
import 'package:hamad/features/notification/screens/notifications_screen.dart';
import 'package:hamad/features/onboarding/onboarding_screen.dart';
import 'package:hamad/features/parent/home/pages/home.dart';
import 'package:hamad/features/profile/pages/change_password_screen.dart';
import 'package:hamad/features/profile/pages/profile_screen.dart';
import 'package:hamad/features/profile/pages/update_profile_screen.dart';
import 'package:hamad/features/root/root_screen.dart';
import 'package:hamad/features/search/search_screen.dart';
import 'package:hamad/features/settings/pages/settings_screen.dart';
import 'package:hamad/features/splash/splash_screen.dart';
import 'package:hamad/features/statics/about.dart';
import 'package:hamad/features/statics/privacy_policy.dart';
import 'package:hamad/features/statics/terms_conditions.dart';
import 'package:hamad/features/student/home/pages/home.dart';
import 'package:hamad/features/supervisor/home/pages/home.dart';
import 'package:hamad/features/teacher/home/pages/home.dart';

List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: AppRoutes.splash.path,
    name: AppRoutes.splash.name,
    builder: (_, _) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.onboarding.path,
    name: AppRoutes.onboarding.name,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: AppRoutes.about.path,
    name: AppRoutes.about.name,
    builder: (_, _) => const AboutScreen(),
  ),
  GoRoute(
    path: AppRoutes.privacyPolicy.path,
    name: AppRoutes.privacyPolicy.name,
    builder: (_, _) => const PrivacyPolicyScreen(),
  ),
  GoRoute(
    path: AppRoutes.termsConditions.path,
    name: AppRoutes.termsConditions.name,
    builder: (_, _) => const TermsConditionsScreen(),
  ),
  GoRoute(
    path: AppRoutes.register.path,
    name: AppRoutes.register.name,
    builder: (_, _) => const RegisterScreen(),
  ),
  GoRoute(
    path: AppRoutes.login.path,
    name: AppRoutes.login.name,
    builder: (_, _) => const LoginScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.resetPassword.path,
        name: AppRoutes.resetPassword.name,
        builder: (_, _) => const PasswordResetScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.resetPasswordDone.path,
      //   name: AppRoutes.resetPasswordDone.name,
      //   builder: (_, _) => const PasswordResetDoneScreen(),
      // ),
    ],
  ),
  GoRoute(
    path: AppRoutes.settings.path,
    name: AppRoutes.settings.name,
    builder: (_, _) => const SettingsScreen(),
  ),
  GoRoute(
    path: AppRoutes.help.path,
    name: AppRoutes.help.name,
    builder: (_, _) => const HelpScreen(),
  ),
  ShellRoute(
    restorationScopeId: 'root',
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) => RootScreen(child: child),
    routes: [
      /// Students
      GoRoute(
        name: AppRoutes.studentHome.name,
        path: AppRoutes.studentHome.path,
        parentNavigatorKey: shellNavigatorKey,
        builder: (_, _) => const StudentHomePage(),
      ),
      GoRoute(
        name: AppRoutes.studentCourses.name,
        path: AppRoutes.studentCourses.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: CoursesPage());
        },
        routes: [
          GoRoute(
            path: AppRoutes.studentCourseDetails.path,
            name: AppRoutes.studentCourseDetails.name,
            builder: (context, state) {
              final id = state.pathParameters['id'];
              AppLog.info('id: $id');
              return const CourseDetailsPage();
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.studentFavorites.name,
        path: AppRoutes.studentFavorites.path,
        parentNavigatorKey: shellNavigatorKey,
        builder: (_, _) => const Scaffold(
          body: Center(
            child: Text('Student Favorites'),
          ),
        ),
      ),

      /// Parent
      GoRoute(
        name: AppRoutes.parentHome.name,
        path: AppRoutes.parentHome.path,
        parentNavigatorKey: shellNavigatorKey,
        builder: (_, _) => const ParentHomePage(),
      ),
      GoRoute(
        name: AppRoutes.parentCourses.name,
        path: AppRoutes.parentCourses.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: CoursesPage());
        },
        routes: [
          GoRoute(
            path: AppRoutes.parentCourseDetails.path,
            name: AppRoutes.parentCourseDetails.name,
            builder: (context, state) {
              final id = state.pathParameters['id'];
              AppLog.info('id: $id');
              return const CourseDetailsPage();
            },
          ),
        ],
      ),

      /// Teacher
      GoRoute(
        name: AppRoutes.teacherHome.name,
        path: AppRoutes.teacherHome.path,
        parentNavigatorKey: shellNavigatorKey,
        builder: (_, _) => const TeacherHomePage(),
      ),

      /// Supervisor
      GoRoute(
        name: AppRoutes.supervisorHome.name,
        path: AppRoutes.supervisorHome.path,
        parentNavigatorKey: shellNavigatorKey,
        builder: (_, _) => const SupervisorHomePage(),
      ),

      /// Shared
      GoRoute(
        name: AppRoutes.search.name,
        path: AppRoutes.search.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          // final query = state.uri.queryParameters['query'];

          return const NoTransitionPage(child: SearchScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.notifications.name,
        path: AppRoutes.notifications.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: NotificationScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.profile.name,
        path: AppRoutes.profile.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: ProfileScreen());
        },
        routes: [
          GoRoute(
            path: AppRoutes.updateProfile.path,
            name: AppRoutes.updateProfile.name,
            builder: (_, _) => const UpdateProfileScreen(),
          ),
          GoRoute(
            path: AppRoutes.changePassword.path,
            name: AppRoutes.changePassword.name,
            builder: (_, _) => const ChangePasswordScreen(),
          ),
        ],
      ),
    ],
  ),
];
