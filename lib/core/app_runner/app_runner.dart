import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taro/app/ui/app.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/di/app_dependencies_creator.dart';
import 'package:taro/core/firebase/tarot_firebase_options.dart';
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

        await _initFirebase(logger: logger);

        final dependencies = await AppDependenciesCreator.create(
          logger: logger,
          flavor: _flavor,
        );

        await _setupFlutterConfigurations(logger: logger);
        _setupBlocConfigurations(logger: logger);

        runApp(App(dependenciesContainer: dependencies));
      },
      (error, stackTrace) {
        logger.logZoneError(
          error,
          stackTrace,
        );
      },
    );
  }

  Future<void> _setupFlutterConfigurations({
    required Logger logger,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await initializeDateFormatting();

    // Configure global error interception
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;
  }

  void _setupBlocConfigurations({
    required Logger logger,
  }) {
    Bloc.observer = AppBlocObserver(logger: logger);
    Bloc.transformer = bloc_concurrency.sequential();
  }

  Future<void> _initFirebase({
    required AppLogger logger,
  }) async {
    try {
      await Firebase.initializeApp(
        options: switch (_flavor) {
          Flavor.dev => TarotFirebaseOptions.dev,
          Flavor.prod => TarotFirebaseOptions.prod,
        },
      );
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
