import 'dart:developer' as dev;

import 'package:logging/logging.dart';

import '../logger.dart';
import 'log_observer.dart';

/// [LogObserver] that prints logs using `dart:developer`.
final class PrintingLogObserver extends LogObserver {
  /// {@macro printing_log_observer}
  const PrintingLogObserver();

  @override
  void onLog(LogMessage logMessage) {
    final logLevelsLength = LogLevel.values.length;
    final severityPerLevel = Level.OFF.value ~/ logLevelsLength;
    final level = logMessage.level.index * severityPerLevel;

    dev.log(
      logMessage.message,
      time: logMessage.timestamp,
      error: logMessage.error,
      stackTrace: logMessage.stackTrace,
      level: level,
      name: logMessage.level.toShortName(),
    );
  }
}
