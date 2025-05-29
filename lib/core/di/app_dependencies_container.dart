import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/utils/alice_service.dart';
import 'package:taro/core/utils/package_info_service.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

/// Container used to reuse dependencies across the application.
class AppDependenciesContainer {
  final Logger logger;
  final AnalyticsReporter analyticsReporter;
  final EnvConfig envConfig;
  final AliceService aliceService;
  final PackageInfoService packageInfoService;

  const AppDependenciesContainer({
    required this.logger,
    required this.analyticsReporter,
    required this.envConfig,
    required this.aliceService,
    required this.packageInfoService,
  });
}
