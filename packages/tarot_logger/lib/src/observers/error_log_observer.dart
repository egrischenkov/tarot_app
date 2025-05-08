import '../logger.dart';
import 'log_observer.dart';
import '../reporters/error_reporter.dart';

/// An observer that reports logs to the error reporter if it is active.
final class ErrorReporterLogObserver extends LogObserver {
  /// Error reporter used to report errors.
  final ErrorReporter _errorReporter;

  const ErrorReporterLogObserver({required ErrorReporter errorReporter}) : _errorReporter = errorReporter;

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
