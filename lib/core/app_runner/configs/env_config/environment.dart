import 'package:flutter/foundation.dart';

enum Environment {
  dev,
  prod;

  bool get isProd => this == Environment.prod;

  bool get isDev => this == Environment.dev;

  const Environment();

  static Environment fromString(String value) => switch (value.trim().toLowerCase()) {
        'dev' => Environment.dev,
        'prod' => Environment.prod,
        _ => kReleaseMode ? Environment.prod : Environment.dev,
      };
}
