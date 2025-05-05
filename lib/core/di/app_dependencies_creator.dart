import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create() async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      analytics: FirebaseAnalytics.instance,
    );

    return AppDependenciesContainer(
      analyticsReporter: analyticsReporter,
    );
  }
}
