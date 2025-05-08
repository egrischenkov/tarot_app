import 'package:logger/logger.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';

/// Container used to reuse dependencies across the application.
class AppDependenciesContainer {
  final AppLogger appLogger;
  final AnalyticsReporter analyticsReporter;

  const AppDependenciesContainer({
    required this.appLogger,
    required this.analyticsReporter,
  });
}
