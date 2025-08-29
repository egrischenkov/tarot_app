// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Tarot';

  @override
  String get onboarding$Path => 'Путь начинается здесь';

  @override
  String get onboarding$Answer => 'Ответ уже\nвнутри тебя';

  @override
  String get onboarding$Cards => 'Карты помогут\nего увидеть';

  @override
  String get onboarding$Skip => 'Пропустить';

  @override
  String get onboarding$Start => 'Вперёд';

  @override
  String get homeScreen$MenuDailyCard => 'Карта дня';

  @override
  String get homeScreen$MenuFunny => 'Приколики';

  @override
  String get homeScreen$MenuSpreads => 'Расклады';

  @override
  String get homeScreen$MenuYammy => 'Вкусняшки';

  @override
  String get profileScreen$Title => 'Профиль';
}
