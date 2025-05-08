import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taro/app_runner/app.dart';
import 'package:taro/core/di/app_dependencies_creator.dart';
import 'package:taro/firebase_options.dart';
import 'package:tarot_logger/logger.dart';

/// A class that is responsible for running the application.
abstract class AppRunner {
  const AppRunner();

  /// Initializes dependencies and launches the application within a guarded execution zone.
  static Future<void> startup() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await initializeDateFormatting();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    final logger = AppLogger(
      observers: [
        if (!kReleaseMode) const PrintingLogObserver(),
        if (kReleaseMode)
          ErrorReporterLogObserver(
            errorReporter: FirebaseErrorReporter(),
          ),
      ],
    );

    // Configure global error interception
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;

    Bloc.observer = AppBlocObserver(logger: logger);
    Bloc.transformer = bloc_concurrency.sequential();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await _launchApplication(logger: logger);
  }

  static Future<void> _launchApplication({
    required AppLogger logger,
  }) async {
    await _initFirebase(logger: logger);

    final dependenciesContainer = await AppDependenciesCreator.create(
      appLogger: logger,
    );

    runApp(App(dependenciesContainer: dependenciesContainer));
  }

  static Future<void> _initFirebase({
    required AppLogger logger,
  }) async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (e, s) {
      logger.error('Firebase initialization error: $e: $s');
    }
  }
}
