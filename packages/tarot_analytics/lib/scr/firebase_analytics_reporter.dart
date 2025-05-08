import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

/// An implementation of [AnalyticsReporter] that reports events to Firebase
/// Analytics.
final class FirebaseAnalyticsReporter implements AnalyticsReporter {
  final Logger _appLogger;
  final FirebaseAnalytics _analytics;

  const FirebaseAnalyticsReporter({
    required Logger logger,
    required FirebaseAnalytics analytics,
  })  : _appLogger = logger,
        _analytics = analytics;

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    _appLogger.trace('Logging analytics event: $event');

    await _analytics.logEvent(
      name: event.name,
      parameters: event.parameters.isEmpty
          ? null
          : {
              for (final parameter in event.parameters) parameter.name: parameter.value,
            },
    );
  }
}
