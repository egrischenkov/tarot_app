import 'logger.dart';
import 'observers/log_observer.dart';

/// AppLogger class, that manages the logging of messages
final class AppLogger extends Logger {
  final List<LogObserver> _observers;

  /// {@macro app_logger}
  AppLogger({
    List<LogObserver> observers = const [],
  }) : _observers = List.unmodifiable(observers);

  @override
  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_observers.isEmpty) {
      return;
    }

    final logMessage = LogMessage(
      message: message,
      level: level,
      error: error,
      stackTrace: stackTrace,
      timestamp: DateTime.now(),
    );

    for (final observer in _observers) {
      observer.onLog(logMessage);
    }
  }
}
