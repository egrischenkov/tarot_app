import 'dart:developer' as dev;

import 'package:logger/src/logger.dart';
import 'package:logger/src/observers/log_observer.dart';
import 'package:logging/logging.dart';

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
