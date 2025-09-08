import 'package:taro/app/data/models/language_model.dart';
import 'package:taro/app/data/models/theme_model.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';

class AppRepositoryImpl {}

extension on LanguageModel {
  LanguageOption get _toLanguageOption {
    return LanguageOption.values.singleWhere((value) {
      return value.name == name;
    });
  }
}

extension on ThemeModel {
  ThemeOption get _toThemeOption {
    return ThemeOption.values.singleWhere((value) {
      return value.name == name;
    });
  }
}
