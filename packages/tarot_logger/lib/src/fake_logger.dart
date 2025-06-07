import 'package:tarot_logger/logger.dart';
import 'package:tarot_logger/src/observers/log_observer.dart';

/// A logger that does nothing.
/// Use this for tests.
final class FakeLogger extends Logger {
  FakeLogger();

  @override
  void log(
    String message, {
    required LogLevel level,
    required List<LogObserver> observers,
    Object? error,
    StackTrace? stackTrace,
  }) {}
}
