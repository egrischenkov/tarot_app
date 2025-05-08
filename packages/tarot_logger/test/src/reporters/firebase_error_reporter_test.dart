import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tarot_logger/logger.dart';

part 'mocks.dart';

void main() {
  late MockFirebaseCrashlytics mockCrashlytics;
  late FirebaseErrorReporter reporter;

  setUp(() {
    mockCrashlytics = MockFirebaseCrashlytics();
    reporter = FirebaseErrorReporter(crashlytics: mockCrashlytics);
  });

  group('FirebaseErrorReporter', () {
    test('init enables crashlytics collection and sets initialized to true', () async {
      when(() => mockCrashlytics.setCrashlyticsCollectionEnabled(true)).thenAnswer((_) async {});

      await reporter.init();

      expect(reporter.isInitialized, isTrue);
      verify(() => mockCrashlytics.setCrashlyticsCollectionEnabled(true)).called(1);
    });

    test('reportError calls recordError with correct arguments', () async {
      final error = Exception('Test error');
      final stack = StackTrace.current;
      const message = 'Test message';

      when(
        () => mockCrashlytics.recordError(
          error,
          stack,
          reason: message,
          fatal: false,
        ),
      ).thenAnswer((_) async {});

      await reporter.reportError(
        message: message,
        error: error,
        stackTrace: stack,
      );

      verify(
        () => mockCrashlytics.recordError(
          error,
          stack,
          reason: message,
          fatal: false,
        ),
      ).called(1);
    });
  });
}
