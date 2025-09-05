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

  @override
  String get profileScreen$Subscription => 'Подписка';

  @override
  String get profileScreen$ChooseSubscription => 'Выбрать подписку';

  @override
  String get profileScreen$SuggestSubscription => 'Нет подписки? Давай подберем';

  @override
  String get settingsScreen$Title => 'Настройки';

  @override
  String get settingsScreen$EditProfile => 'Редактировать профиль';

  @override
  String get settingsScreen$ManageSubscription => 'Управление подпиской';

  @override
  String get settingsScreen$App => 'Приложение';

  @override
  String get settingsScreen$ChangeLanguage => 'Изменить язык';

  @override
  String get settingsScreen$ChangeTheme => 'Тема оформления';

  @override
  String get settingsScreen$AboutApp => 'О приложении';

  @override
  String get settingsScreen$FeedbackForm => 'Форма обратной связи';

  @override
  String get settingsScreen$LogOut => 'Выйти из аккаунта';

  @override
  String get settingsScreen$Theme$Light => 'Всегда светлая';

  @override
  String get settingsScreen$Theme$Dark => 'Всегда тёмная';

  @override
  String get settingsScreen$Theme$System => 'Как в системе';
}
