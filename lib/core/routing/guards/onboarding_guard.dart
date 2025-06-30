import 'package:auto_route/auto_route.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

class OnboardingGuard extends AutoRouteGuard {
  final AppConfigurationsStorage _sharedPreferencesStorage;

  OnboardingGuard({
    required AppConfigurationsStorage sharedPreferencesStorage,
  }) : _sharedPreferencesStorage = sharedPreferencesStorage;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final completed = _sharedPreferencesStorage.isOnboardingCompleted;
    if (completed) {
      router.replaceAll([const HomeRoute()]);
    } else {
      resolver.next(true);
    }
  }
}
