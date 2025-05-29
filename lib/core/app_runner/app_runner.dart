import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taro/core/app_runner/app.dart';
import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_creator.dart';
import 'package:tarot_logger/logger.dart';

/// A class that is responsible for running the application.
final class AppRunner {
  final Flavor _flavor;

  const AppRunner._({
    required Flavor flavor,
  }) : _flavor = flavor;

  factory AppRunner.dev() => const AppRunner._(flavor: Flavor.dev);
  factory AppRunner.prod() => const AppRunner._(flavor: Flavor.prod);

  /// Initializes dependencies and launches the application within a guarded execution zone.
  Future<void> startup() async {
    final logger = AppLogger(
      observers: [
        if (!kReleaseMode) const PrintingLogObserver(),
      ],
    );

    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

        await initializeDateFormatting();

        // Configure global error interception
        FlutterError.onError = logger.logFlutterError;
        WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;

        Bloc.observer = AppBlocObserver(logger: logger);
        Bloc.transformer = bloc_concurrency.sequential();

        await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

        await _launchApplication(logger: logger);
      },
      (error, stackTrace) {
        logger.logZoneError(
          error,
          stackTrace,
        );
      },
    );
  }

  Future<AppDependenciesContainer> _createDependencies() async {
    await _initAnalyticsService(logger: logger);

    final dependenciesContainer = await AppDependenciesCreator.create(
      logger: logger,
    );
  }

  void _launchApplication() {
    runApp(App(dependenciesContainer: dependenciesContainer));
  }

  Future<void> _initAnalyticsService({
    required AppLogger logger,
  }) async {
    try {
      await Firebase.initializeApp(options: _flavorConfig.firebaseOptions);
      if (kReleaseMode) {
        logger.addObserver(
          ErrorReporterLogObserver(
            errorReporter: FirebaseErrorReporter(),
          ),
        );
      }
    } catch (e, s) {
      logger.error('Firebase initialization error: $e: $s');
    }
  }
}
