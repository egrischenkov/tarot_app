import 'package:flutter/material.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class TestWidgetWrapper extends StatelessWidget {
  final Widget child;

  const TestWidgetWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UiKitTheme.lightThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
