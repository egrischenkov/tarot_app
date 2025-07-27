// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DailyCardScreen]
class DailyCardRoute extends PageRouteInfo<void> {
  const DailyCardRoute({List<PageRouteInfo>? children})
    : super(DailyCardRoute.name, initialChildren: children);

  static const String name = 'DailyCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DailyCardScreen();
    },
  );
}

/// generated route for
/// [DebugScreen]
class DebugRoute extends PageRouteInfo<void> {
  const DebugRoute({List<PageRouteInfo>? children})
    : super(DebugRoute.name, initialChildren: children);

  static const String name = 'DebugRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DebugScreen();
    },
  );
}

/// generated route for
/// [DebugWrapperEntry]
class DebugWrapperRoute extends PageRouteInfo<void> {
  const DebugWrapperRoute({List<PageRouteInfo>? children})
    : super(DebugWrapperRoute.name, initialChildren: children);

  static const String name = 'DebugWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DebugWrapperEntry();
    },
  );
}

/// generated route for
/// [DecksScreen]
class DecksRoute extends PageRouteInfo<void> {
  const DecksRoute({List<PageRouteInfo>? children})
    : super(DecksRoute.name, initialChildren: children);

  static const String name = 'DecksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DecksScreen();
    },
  );
}

/// generated route for
/// [FunnyScreen]
class FunnyRoute extends PageRouteInfo<void> {
  const FunnyRoute({List<PageRouteInfo>? children})
    : super(FunnyRoute.name, initialChildren: children);

  static const String name = 'FunnyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FunnyScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    int initialPage = 0,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(initialPage: initialPage, key: key),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return OnboardingScreen(initialPage: args.initialPage, key: args.key);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.initialPage = 0, this.key});

  final int initialPage;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{initialPage: $initialPage, key: $key}';
  }
}

/// generated route for
/// [YammyScreen]
class YammyRoute extends PageRouteInfo<void> {
  const YammyRoute({List<PageRouteInfo>? children})
    : super(YammyRoute.name, initialChildren: children);

  static const String name = 'YammyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const YammyScreen();
    },
  );
}
