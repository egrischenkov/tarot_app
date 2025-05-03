import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taro/app_runner/app.dart';
import 'package:taro/core/di/app_dependencies_creator.dart';

/// A class that is responsible for running the application.
abstract class AppRunner {
  const AppRunner();

  /// Initializes dependencies and launches the application within a guarded execution zone.
  static Future<void> startup() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await initializeDateFormatting();

    await _launchApplication();
  }

  static Future<void> _launchApplication() async {
    final dependenciesContainer = await AppDependenciesCreator.create();

    runApp(App(dependenciesContainer: dependenciesContainer));
  }
}
