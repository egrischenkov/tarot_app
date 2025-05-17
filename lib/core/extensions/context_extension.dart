import 'package:flutter/material.dart';
import 'package:taro/core/di/app_dependencies_container.dart' show AppDependenciesContainer;
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';

extension ContextExtension on BuildContext {
  /// Get the localization instance for the current context
  /// using the [AppLocalizations] class.
  /// This allows you to access localized strings and resources
  /// defined in your app's localization files.
  /// Example usage:
  /// ```dart
  /// final localizedString = context.l10n.someLocalizedString;
  /// ```
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Obtain the nearest widget of the given type T,
  /// which must be the type of a concrete [InheritedWidget] subclass,
  /// and register this build context with that widget such that
  /// when that widget changes (or a new widget of that type is introduced,
  /// or the widget goes away), this build context is rebuilt so that it can
  /// obtain new values from that widget.
  T inheritOf<T extends InheritedWidget>({bool listen = true}) =>
      _inheritMaybeOf<T>(listen: listen) ??
      (throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a $T of the exact type',
        'out_of_scope',
      ));

  /// Obtain the nearest widget of the given type T,
  /// which must be the type of a concrete [InheritedWidget] subclass,
  /// and register this build context with that widget such that
  /// when that widget changes (or a new widget of that type is introduced,
  /// or the widget goes away), this build context is rebuilt so that it can
  /// obtain new values from that widget.
  T? _inheritMaybeOf<T extends InheritedWidget>({bool listen = true}) =>
      listen ? dependOnInheritedWidgetOfExactType<T>() : getInheritedWidgetOfExactType<T>();

  AppDependenciesContainer get appDependenciesContainer {
    return AppDependenciesScope.of(this);
  }
}
