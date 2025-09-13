import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitGoldenTestWrapper extends StatelessWidget {
  final Widget child;
  final ThemeData? themeData;

  const UiKitGoldenTestWrapper({
    required this.child,
    this.themeData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData ?? UiKitTheme.lightThemeData,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
