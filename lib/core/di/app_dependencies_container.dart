import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:taro/core/utils/device_info_service.dart';
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
  final DeviceInfoService deviceInfoService;
  final Flavor flavor;
  final AppConfigurationsStorage appConfigurationsStorage;

  const AppDependenciesContainer({
    required this.logger,
    required this.analyticsReporter,
    required this.envConfig,
    required this.httpInspectorService,
    required this.packageInfoService,
    required this.deviceInfoService,
    required this.flavor,
    required this.appConfigurationsStorage,
  });
}
