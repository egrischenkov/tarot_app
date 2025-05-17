import 'package:taro/core/app_runner/configs/env_config/env_config.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

/// Container used to reuse dependencies across the application.
class AppDependenciesContainer {
  final Logger logger;
  final AnalyticsReporter analyticsReporter;
  final EnvConfig envConfig;

  const AppDependenciesContainer({
    required this.logger,
    required this.analyticsReporter,
    required this.envConfig,
  });
}
