import 'logger.dart';
import 'observers/log_observer.dart';

/// AppLogger class, that manages the logging of messages
final class AppLogger extends Logger {
  @override
  void log(
    String message, {
    required LogLevel level,
    required List<LogObserver> observers,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (observers.isEmpty) {
      return;
    }

    final logMessage = LogMessage(
      message: message,
      level: level,
      error: error,
      stackTrace: stackTrace,
      timestamp: DateTime.now(),
    );

    for (final observer in observers) {
      observer.onLog(logMessage);
    }
  }
}
