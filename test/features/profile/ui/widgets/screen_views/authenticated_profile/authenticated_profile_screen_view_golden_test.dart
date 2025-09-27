import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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

import '../../../../../../utils/golden_test_widget_wrapper.dart';
import '../../../../../settings/ui/mocks.dart';

void main() {
  late final ProfileRepositoryMock profileRepositoryMock;

  late final ProfileBloc profileBloc;

  setUpAll(() {
    profileRepositoryMock = ProfileRepositoryMock();

    registerFallbackValue(UserAuthenticationStatus);

    when(() => profileRepositoryMock.getUserAuthenticationStatus()).thenReturn(UserAuthenticationStatus.authenticated);
    when(() => profileRepositoryMock.getSavedUser()).thenReturn(
      const User(
        email: 'test@test.test',
        name: 'Test',
      ),
    );

    profileBloc = ProfileBloc(
      setAuthStatusUseCase: SetCurrentUserAuthenticationStatusUseCase(profileRepository: profileRepositoryMock),
      getAuthStatusUseCase: GetCurrentUserAuthenticationStatus(profileRepository: profileRepositoryMock),
      deleteSavedUserUseCase: DeleteSavedUserUseCase(profileRepository: profileRepositoryMock),
      getSavedUserUseCase: GetSavedUserUseCase(profileRepository: profileRepositoryMock),
      saveUserUseCase: SaveUserUseCase(profileRepository: profileRepositoryMock),
    );
  });

  group('Authenticated screen view golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'authenticated_screen_view_light_theme',
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
        ],
        themeData: UiKitTheme.lightThemeData,
        child: const AuthenticatedProfileScreenView(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'authenticated_screen_view_dark_theme',
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
        ],
        themeData: UiKitTheme.darkThemeData,
        child: const AuthenticatedProfileScreenView(),
      ),
    );
  });
}
