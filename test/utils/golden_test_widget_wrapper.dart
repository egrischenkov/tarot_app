import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class TestWidgetWrapper extends StatelessWidget {
  final Widget child;
  final ThemeData? themeData;

  const TestWidgetWrapper({
    required this.child,
    this.themeData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData ?? UiKitTheme.lightThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: StackRouterScope(
        controller: StackRouterMock(),
        stateHash: 0,
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}

class StackRouterMock extends Mock implements StackRouter {}
