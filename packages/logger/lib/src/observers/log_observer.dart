import 'package:logger/src/logger.dart';

/// Observer class, that is notified when a new log message is created
abstract base class LogObserver {
  const LogObserver();

  /// Called when a new log message is created.
  void onLog(LogMessage logMessage);
}
