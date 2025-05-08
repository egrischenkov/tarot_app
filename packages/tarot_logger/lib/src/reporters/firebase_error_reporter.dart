import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'error_reporter.dart';

/// An implementation of [ErrorReporter] that reports errors to Firebase Crashlytics.
class FirebaseErrorReporter implements ErrorReporter {
  final FirebaseCrashlytics _crashlytics;

  bool _initialized = false;

  FirebaseErrorReporter({FirebaseCrashlytics? crashlytics})
      : _crashlytics = crashlytics ?? FirebaseCrashlytics.instance;

  @override
  bool get isInitialized => _initialized;

  @override
  Future<void> init() async {
    try {
      await _crashlytics.setCrashlyticsCollectionEnabled(true);
      _initialized = true;
    } catch (e, s) {
      debugPrint('Failed to init FirebaseErrorReporter: $e, $s');
    }
  }

  @override
  Future<void> close() async {
    // Firebase Crashlytics does not require explicit closing.
    // It will automatically handle the lifecycle.
  }

  @override
  Future<void> reportError({
    required String message,
    required Object error,
    required StackTrace stackTrace,
  }) async {
    try {
      await _crashlytics.recordError(
        error,
        stackTrace,
        reason: message,
        fatal: false,
      );
    } catch (e, s) {
      debugPrint('Failed to report error to Firebase Crashlytics: $e, $s');
    }
  }
}
