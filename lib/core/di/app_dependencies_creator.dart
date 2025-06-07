import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/utils/http_inspector_service/alice_service.dart';
import 'package:taro/core/utils/package_info_service.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

// TODO(egrischenkov): Convert to factory
class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create({required Logger logger, required Flavor flavor}) async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      logger: logger,
      analytics: FirebaseAnalytics.instance,
    );

    final packageInfoService = PackageInfoService();
    await packageInfoService.init();

    final aliceHttpInspectorService = AliceHttpInspectorService();
    aliceHttpInspectorService.init();

    return AppDependenciesContainer(
      logger: logger,
      analyticsReporter: analyticsReporter,
      envConfig: const EnvConfig(),
      httpInspectorService: aliceHttpInspectorService,
      packageInfoService: packageInfoService,
      flavor: flavor,
    );
  }
}
