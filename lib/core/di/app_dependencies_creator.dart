import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create({
    required Logger logger,
  }) async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      logger: logger,
      analytics: FirebaseAnalytics.instance,
    );

    return AppDependenciesContainer(
      logger: logger,
      analyticsReporter: analyticsReporter,
    );
  }
}
