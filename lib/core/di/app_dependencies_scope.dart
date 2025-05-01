import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/extensions/context_extension.dart';

/// {@template dependencies_scope}
/// A scope that provides composed [AppDependenciesContainer].
///
/// **Testing**:
///
/// To use [AppDependenciesScope] in tests, it is needed to wrap the widget with
/// [AppDependenciesScope], extend [TestAppDependenciesContainer] and provide the
/// dependencies that are needed for the test.
///
/// ```dart
/// class AuthDependenciesContainer extends TestDependenciesContainer {
///   // for example, use mocks created by mockito, or pass fake/real implementations
///   // via constructor.
///   @override
///   final MockAuthRepository authRepository = MockAuthRepository();
/// }
/// ```
/// {@endtemplate}
class AppDependenciesScope extends InheritedWidget {
  final AppDependenciesContainer dependencies;

  /// {@macro dependencies_scope}
  const AppDependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  static AppDependenciesContainer of(BuildContext context) =>
      context.inheritOf<AppDependenciesScope>(listen: false).dependencies;

  @override
  bool updateShouldNotify(AppDependenciesScope oldWidget) => false;
}
