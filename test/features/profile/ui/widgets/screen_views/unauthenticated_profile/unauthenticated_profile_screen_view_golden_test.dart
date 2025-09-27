import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/delete_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/get_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/save_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';
import 'package:taro/features/profile/ui/screens/profile_screen.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../../../../app/data/mocks.dart';
import '../../../../../../utils/golden_test_widget_wrapper.dart';
import '../../../../../settings/ui/mocks.dart';

void main() {
  late final AppRepositoryMock appRepositoryMock;
  late final ProfileRepositoryMock profileRepositoryMock;

  late final ThemeBloc themeBloc;
  late final LanguageBloc languageBloc;
  late final ProfileBloc profileBloc;

  setUpAll(() {
    appRepositoryMock = AppRepositoryMock();
    profileRepositoryMock = ProfileRepositoryMock();

    registerFallbackValue(UserAuthenticationStatus);

    when(() => appRepositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.light);
    when(() => appRepositoryMock.getCurrentLanguageOption()).thenReturn(LanguageOption.russian);

    when(() => profileRepositoryMock.getUserAuthenticationStatus()).thenReturn(UserAuthenticationStatus.authenticated);
    when(() => profileRepositoryMock.getSavedUser()).thenReturn(
      const User(
        email: 'test@test.test',
        name: 'Test',
      ),
    );
    themeBloc = ThemeBloc(
      getCurrentThemeUseCase: GetCurrentThemeUseCase(appRepository: appRepositoryMock),
      changeThemeUseCase: ChangeThemeUseCase(appRepository: appRepositoryMock),
    );
    languageBloc = LanguageBloc(
      getCurrentLanguageUseCase: GetCurrentLanguageUseCase(appRepository: appRepositoryMock),
      changeLanguageUseCase: ChangeLanguageUseCase(appRepository: appRepositoryMock),
    );

    profileBloc = ProfileBloc(
      setAuthStatusUseCase: SetCurrentUserAuthenticationStatusUseCase(profileRepository: profileRepositoryMock),
      getAuthStatusUseCase: GetCurrentUserAuthenticationStatus(profileRepository: profileRepositoryMock),
      deleteSavedUserUseCase: DeleteSavedUserUseCase(profileRepository: profileRepositoryMock),
      getSavedUserUseCase: GetSavedUserUseCase(profileRepository: profileRepositoryMock),
      saveUserUseCase: SaveUserUseCase(profileRepository: profileRepositoryMock),
    );
  });

  group('Unauthenticated screen view golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'unauthenticated_screen_view_light_theme',
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: profileBloc),
          BlocProvider.value(value: themeBloc),
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.lightThemeData,
        child: const UnauthenticatedProfileScreenView(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'unauthenticated_screen_view_dark_theme',
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: profileBloc),
          BlocProvider.value(value: themeBloc),
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.darkThemeData,
        child: const UnauthenticatedProfileScreenView(),
      ),
    );
  });
}
