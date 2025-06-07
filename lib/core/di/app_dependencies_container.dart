import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/utils/http_inspector_service/http_inspector_service.dart';
import 'package:taro/core/utils/package_info_service.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

/// Container used to reuse dependencies across the application.
class AppDependenciesContainer {
  final Logger logger;
  final AnalyticsReporter analyticsReporter;
  final EnvConfig envConfig;
  final HttpInspectorService httpInspectorService;
  final PackageInfoService packageInfoService;
  final Flavor flavor;

  const AppDependenciesContainer({
    required this.logger,
    required this.analyticsReporter,
    required this.envConfig,
    required this.httpInspectorService,
    required this.packageInfoService,
    required this.flavor,
  });
}
