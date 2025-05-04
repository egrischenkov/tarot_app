import 'package:tarot_analytics/scr/analytics_reporter.dart';

/// Container used to reuse dependencies across the application.
class AppDependenciesContainer {
  final AnalyticsReporter analyticsReporter;

  const AppDependenciesContainer({
    required this.analyticsReporter,
  });
}
