import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

part 'mocks.dart';

void main() {
  late FirebaseAnalyticsReporter reporter;
  late FirebaseAnalytics mockAnalytics;

  setUp(() {
    mockAnalytics = FirebaseAnalyticsMock();
    reporter = FirebaseAnalyticsReporter(
      logger: FakeLogger(),
      analytics: mockAnalytics,
    );
  });

  group('FirebaseAnalyticsReporter', () {
    test('logEvent logs event to Firebase Analytics', () async {
      const event = AnalyticsEvent('test_event');

      when(
        () => mockAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});

      await reporter.logEvent(event);

      verify(() => mockAnalytics.logEvent(name: 'test_event')).called(1);
    });

    test('logEvent logs event with parameters', () async {
      const event = AnalyticsEvent(
        'test_event',
        parameters: {
          StringAnalyticsParameter('test_parameter', 'test_value'),
          StringAnalyticsParameter('test_parameter2', 'test_value2'),
          NumberAnalyticsParameter('number_event', 42),
        },
      );

      when(
        () => mockAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});

      await reporter.logEvent(event);

      verify(
        () => mockAnalytics.logEvent(
          name: 'test_event',
          parameters: {
            'test_parameter': 'test_value',
            'test_parameter2': 'test_value2',
            'number_event': 42,
          },
        ),
      ).called(1);
    });
  });
}
