import 'app_route_path_cache.dart';

export 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  resetPassword('reset-password', 'resetPassword'),
  // resetPasswordDone('reset-password-done', 'resetPasswordDone'),
  register('/register', 'register'),
  root('/root', 'root'),
  profile('/profile', 'profile'),
  changePassword('/change-password', 'changePassword'),
  updateProfile('/update-profile', 'updateProfile'),
  help('/help', 'help'),
  about('/about', 'about'),
  termsConditions('/terms-conditions', 'termsConditions'),
  privacyPolicy('/privacy-policy', 'privacyPolicy'),
  home('/home', 'home'),
  notifications('/notifications', 'notifications'),
  settings('/settings', 'settings'),
  search('/search', 'search'),

  /// Student

  studentHome('/student/home', 'studentHome'),
  studentCourses('/student/courses', 'courses'),
  studentCourseDetails('/student/courses/:id', 'courseDetails'),
  studentsubscribedCourseDetails(
    '/student/subscribedCourses/:id',
    'studentsubscribedCourseDetails',
  ),
  studentFavorites('/student/favorites', 'favorites'),

  /// Parent
  parentHome('/parent/home', 'parentHome'),
  parentCourses('/parent/courses', 'parentCourses'),
  parentCourseDetails('/parent/courses/:id', 'parentCourseDetails'),
  parentCalendar('/parent/calendar', 'parentCalendar'),
  parentPayments('/parent/payments', 'parentPayments'),

  /// Teacher
  teacherHome('/teacher/home', 'teacherHome'),
  teacherCalendar('/teacher/calendar', 'teacherCalendar'),
  teacherCourses('/teacher/courses', 'teacherCourses'),
  teacherCoursesDetails('/teacher/courses/:id', 'teacherCoursesDetails'),

  /// Supervisor
  supervisorHome('/supervisor/home', 'supervisorHome'),
  supervisorCourses('/supervisor/courses', 'supervisorCourses'),
  supervisorCoursesDetails(
    '/supervisor/courses/:id',
    'supervisorCoursesDetails',
  ),
  supervisorPepole('/supervisor/pepole', 'supervisorPepole'),
  supervisorCalendar('/supervisor/calendar', 'supervisorCalendar');

  final String path;
  final String name;
  // ignore: sort_constructors_first
  const AppRoutes(this.path, this.name);

  String get fullPath => AppRoutePathCache.instance.getFullPath(this);
}
