import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/single_child_widget.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/di/test_app_dependencies_container.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class GoldenTestWidgetWrapper extends StatelessWidget {
  final Widget child;
  final AppDependenciesContainer? dependenciesContainer;
  final ThemeData? themeData;
  final List<SingleChildWidget>? providers;

  const GoldenTestWidgetWrapper({
    required this.child,
    this.dependenciesContainer,
    this.themeData,
    this.providers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: dependenciesContainer ?? const TestAppDependenciesContainer(),
      child: MaterialApp(
        theme: themeData ?? UiKitTheme.lightThemeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StackRouterScope(
          controller: StackRouterMock(),
          stateHash: 0,
          child: Scaffold(
            body: providers != null
                ? MultiBlocProvider(
                    providers: providers!,
                    child: child,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}

class StackRouterMock extends Mock implements StackRouter {}
