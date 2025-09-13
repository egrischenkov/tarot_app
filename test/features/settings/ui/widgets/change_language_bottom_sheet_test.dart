import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/features/settings/ui/widgets/change_language_bottom_sheet.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../../app/data/mocks.dart';
import '../../../../utils/golden_test_widget_wrapper.dart';

void main() {
  late final AppRepositoryMock appRepositoryMock;
  late final LanguageBloc languageBloc;

  setUpAll(() {
    appRepositoryMock = AppRepositoryMock();

    when(() => appRepositoryMock.getCurrentLanguageOption()).thenReturn(LanguageOption.chinese);

    languageBloc = LanguageBloc(
      getCurrentLanguageUseCase: GetCurrentLanguageUseCase(appRepository: appRepositoryMock),
      changeLanguageUseCase: ChangeLanguageUseCase(appRepository: appRepositoryMock),
    );
  });
  group('Change language bottom sheet  golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'change_language_bottom_sheet_light_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.lightThemeData,
        child: ChangeLanguageBottomSheet.getBodyForTest(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'change_language_bottom_sheet_dark_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.darkThemeData,
        child: ChangeLanguageBottomSheet.getBodyForTest(),
      ),
    );
  });
}
