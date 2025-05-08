import 'dart:async';

import 'package:logger/src/logger.dart';
import 'package:logger/src/observers/log_observer.dart';

/// An interface for reporting errors.
///
/// Implementations should report errors to a service like Sentry/Crashlytics.
abstract interface class ErrorReporter {
  /// Returns `true` if the error reporting service is initialized
  /// and ready to report errors.
  ///
  /// If this returns `false`, the error reporting service should not be used.
  bool get isInitialized;

  /// Initializes the error reporting service.
  Future<void> init();

  /// Closes the error reporting service.
  Future<void> close();

  /// Capture an exception to be reported.
  ///
  /// The [message] is the description of exception.
  /// The [error] is the error that was thrown.
  /// The [stackTrace] is the stack trace associated with the exception.
  Future<void> reportError({
    required String message,
    required Object error,
    required StackTrace stackTrace,
  });
}

/// An observer that reports logs to the error reporter if it is active.
final class ErrorReporterLogObserver extends LogObserver {
  /// Error reporter used to report errors.
  final ErrorReporter _errorReporter;

  const ErrorReporterLogObserver(this._errorReporter);

  @override
  void onLog(LogMessage logMessage) {
    // If the error reporter is not initialized, do nothing
    if (!_errorReporter.isInitialized) {
      return;
    }

    // If the log level is error or higher, report the error
    if (logMessage.level.index >= LogLevel.error.index) {
      _errorReporter.reportError(
        message: logMessage.message,
        error: logMessage.error ?? _ReportedMessageException(logMessage.message),
        stackTrace: logMessage.stackTrace ?? StackTrace.current,
      );
    }
  }
}

/// An exception used for error logs without an exception, only a message.
class _ReportedMessageException implements Exception {
  /// The message that was reported.
  final String message;

  const _ReportedMessageException(this.message);

  @override
  String toString() => message;
}
