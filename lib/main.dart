import 'package:flutter/material.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';

void main() {
  runApp(const Taro());
}

class Taro extends StatelessWidget {
  const Taro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Placeholder(),
    );
  }
}
