class CourseData {
  CourseData({
    required this.title,
    required this.iconPath,
    required this.totalSessions,
    required this.completedSessions,
    required this.missedSessions,
    required this.totalJobs,
    required this.completedJobs,
    required this.missedJobs,
    required this.totalEvaluations,
    required this.positiveEvaluations,
    required this.negativeEvaluations,
    required this.commitmentPercentage,
    required this.motivationalMessage,
  });
  final String title;
  final String iconPath;
  final int totalSessions;
  final int completedSessions;
  final int missedSessions;
  final int totalJobs;
  final int completedJobs;
  final int missedJobs;
  final int totalEvaluations;
  final int positiveEvaluations;
  final int negativeEvaluations;
  final double commitmentPercentage;
  final String motivationalMessage;
}
