import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/features/settings/ui/widgets/change_theme_bottom_sheet.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../../../app/data/mocks.dart';
import '../../../../../utils/golden_test_widget_wrapper.dart';

void main() {
  late final AppRepositoryMock appRepositoryMock;
  late final ThemeBloc themeBloc;

  setUpAll(() {
    appRepositoryMock = AppRepositoryMock();

    when(() => appRepositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.dark);

    themeBloc = ThemeBloc(
      getCurrentThemeUseCase: GetCurrentThemeUseCase(appRepository: appRepositoryMock),
      changeThemeUseCase: ChangeThemeUseCase(appRepository: appRepositoryMock),
    );
  });
  group('Change theme bottom sheet  golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'change_theme_bottom_sheet_light_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: themeBloc),
        ],
        themeData: UiKitTheme.lightThemeData,
        child: ChangeThemeBottomSheet.getBodyForTest(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'change_theme_bottom_sheet_dark_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: themeBloc),
        ],
        themeData: UiKitTheme.darkThemeData,
        child: ChangeThemeBottomSheet.getBodyForTest(),
      ),
    );
  });
}
