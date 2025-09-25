import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.g.dart';
import 'app_localizations_en.g.dart';
import 'app_localizations_es.g.dart';
import 'app_localizations_fr.g.dart';
import 'app_localizations_hi.g.dart';
import 'app_localizations_it.g.dart';
import 'app_localizations_pt.g.dart';
import 'app_localizations_ru.g.dart';
import 'app_localizations_zh.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Stary'**
  String get appName;

  /// No description provided for @companyName.
  ///
  /// In ru, this message translates to:
  /// **'Tarot Band'**
  String get companyName;

  /// No description provided for @common$Error.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так. Пожалуйста, попробуйте позже.'**
  String get common$Error;

  /// No description provided for @onboarding$Title$First.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в мир {appName}'**
  String onboarding$Title$First(Object appName);

  /// No description provided for @onboarding$Subtitle$First.
  ///
  /// In ru, this message translates to:
  /// **'Откройте карты, чтобы лучше понять себя, услышать подсказки Вселенной и найти ответы на важные вопросы.'**
  String get onboarding$Subtitle$First;

  /// No description provided for @onboarding$Title$Second.
  ///
  /// In ru, this message translates to:
  /// **'Начинайте утро с подсказки'**
  String get onboarding$Title$Second;

  /// No description provided for @onboarding$Subtitle$Second.
  ///
  /// In ru, this message translates to:
  /// **'Тяните карту дня — и получайте вдохновение, совет или предостережение.'**
  String get onboarding$Subtitle$Second;

  /// No description provided for @onboarding$Title$Third.
  ///
  /// In ru, this message translates to:
  /// **'Ваш личный проводник'**
  String get onboarding$Title$Third;

  /// No description provided for @onboarding$Subtitle$Third.
  ///
  /// In ru, this message translates to:
  /// **'Получайте ежедневные расклады, советы для принятия решений и глубже исследуйте свою интуицию.'**
  String get onboarding$Subtitle$Third;

  /// No description provided for @onboarding$Button$Label.
  ///
  /// In ru, this message translates to:
  /// **'Поехали'**
  String get onboarding$Button$Label;

  /// No description provided for @homeScreen$Menu$DailyCard.
  ///
  /// In ru, this message translates to:
  /// **'Карта дня'**
  String get homeScreen$Menu$DailyCard;

  /// No description provided for @homeScreen$Menu$CardsCatalog.
  ///
  /// In ru, this message translates to:
  /// **'Узнай карты'**
  String get homeScreen$Menu$CardsCatalog;

  /// No description provided for @homeScreen$Menu$YesNo.
  ///
  /// In ru, this message translates to:
  /// **'Да или Нет'**
  String get homeScreen$Menu$YesNo;

  /// No description provided for @profileScreen$Title.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileScreen$Title;

  /// No description provided for @profileScreen$Subscription.
  ///
  /// In ru, this message translates to:
  /// **'Подписка'**
  String get profileScreen$Subscription;

  /// No description provided for @profileScreen$ChooseSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать подписку'**
  String get profileScreen$ChooseSubscription;

  /// No description provided for @profileScreen$SuggestSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Нет подписки? Давай подберем'**
  String get profileScreen$SuggestSubscription;

  /// No description provided for @profileScreen$LoginButton$Label.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get profileScreen$LoginButton$Label;

  /// No description provided for @profileScreen$AddInfo$Title.
  ///
  /// In ru, this message translates to:
  /// **'Заполните профиль, чтобы открыть больше возможностей!'**
  String get profileScreen$AddInfo$Title;

  /// No description provided for @profileScreen$AddInfo$Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте дату рождения, пол, семейное положение и даже информацию о работе — и приложение будет подбирать для вас персональные карты дня, расклады и прогнозы, созданные специально под ваш профиль.'**
  String get profileScreen$AddInfo$Subtitle;

  /// No description provided for @profileScreen$AddInfo$Button$Label.
  ///
  /// In ru, this message translates to:
  /// **'Заполнить профиль'**
  String get profileScreen$AddInfo$Button$Label;

  /// No description provided for @profileScreen$JoinUs.
  ///
  /// In ru, this message translates to:
  /// **'Присоединяйтесь — и карты будут говорить только для вас'**
  String get profileScreen$JoinUs;

  /// No description provided for @settingsScreen$Title.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsScreen$Title;

  /// No description provided for @settingsScreen$EditProfile.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать профиль'**
  String get settingsScreen$EditProfile;

  /// No description provided for @settingsScreen$ManageSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Управление подпиской'**
  String get settingsScreen$ManageSubscription;

  /// No description provided for @settingsScreen$App.
  ///
  /// In ru, this message translates to:
  /// **'Приложение'**
  String get settingsScreen$App;

  /// No description provided for @settingsScreen$ChangeLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Изменить язык'**
  String get settingsScreen$ChangeLanguage;

  /// No description provided for @settingsScreen$ChangeTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тема оформления'**
  String get settingsScreen$ChangeTheme;

  /// No description provided for @settingsScreen$AboutApp.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get settingsScreen$AboutApp;

  /// No description provided for @settingsScreen$FeedbackForm.
  ///
  /// In ru, this message translates to:
  /// **'Форма обратной связи'**
  String get settingsScreen$FeedbackForm;

  /// No description provided for @settingsScreen$LogOut.
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта'**
  String get settingsScreen$LogOut;

  /// No description provided for @settingsScreen$Theme$Light.
  ///
  /// In ru, this message translates to:
  /// **'Всегда светлая'**
  String get settingsScreen$Theme$Light;

  /// No description provided for @settingsScreen$Theme$Dark.
  ///
  /// In ru, this message translates to:
  /// **'Всегда тёмная'**
  String get settingsScreen$Theme$Dark;

  /// No description provided for @settingsScreen$Theme$System.
  ///
  /// In ru, this message translates to:
  /// **'Как в системе'**
  String get settingsScreen$Theme$System;

  /// No description provided for @settingsScreen$Language$Ru.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get settingsScreen$Language$Ru;

  /// No description provided for @settingsScreen$Language$En.
  ///
  /// In ru, this message translates to:
  /// **'English'**
  String get settingsScreen$Language$En;

  /// No description provided for @settingsScreen$Language$De.
  ///
  /// In ru, this message translates to:
  /// **'Deutsch'**
  String get settingsScreen$Language$De;

  /// No description provided for @settingsScreen$Language$Es.
  ///
  /// In ru, this message translates to:
  /// **'Español'**
  String get settingsScreen$Language$Es;

  /// No description provided for @settingsScreen$Language$Fr.
  ///
  /// In ru, this message translates to:
  /// **'Français'**
  String get settingsScreen$Language$Fr;

  /// No description provided for @settingsScreen$Language$Hi.
  ///
  /// In ru, this message translates to:
  /// **'हिन्दी'**
  String get settingsScreen$Language$Hi;

  /// No description provided for @settingsScreen$Language$It.
  ///
  /// In ru, this message translates to:
  /// **'Italiano'**
  String get settingsScreen$Language$It;

  /// No description provided for @settingsScreen$Language$Pt.
  ///
  /// In ru, this message translates to:
  /// **'Português'**
  String get settingsScreen$Language$Pt;

  /// No description provided for @settingsScreen$Language$Zh.
  ///
  /// In ru, this message translates to:
  /// **'中文'**
  String get settingsScreen$Language$Zh;

  /// No description provided for @feedbackFormScreen$Title.
  ///
  /// In ru, this message translates to:
  /// **'Форма обратной связи'**
  String get feedbackFormScreen$Title;

  /// No description provided for @feedbackFormScreen$ShareYourFeedback.
  ///
  /// In ru, this message translates to:
  /// **'Поделитесь вашим фидбеком'**
  String get feedbackFormScreen$ShareYourFeedback;

  /// No description provided for @feedbackFormScreen$RateYourExperience.
  ///
  /// In ru, this message translates to:
  /// **'Ваше впечатление'**
  String get feedbackFormScreen$RateYourExperience;

  /// No description provided for @feedbackFormScreen$TerribleRate.
  ///
  /// In ru, this message translates to:
  /// **'Ужасно'**
  String get feedbackFormScreen$TerribleRate;

  /// No description provided for @feedbackFormScreen$BadRate.
  ///
  /// In ru, this message translates to:
  /// **'Плохо'**
  String get feedbackFormScreen$BadRate;

  /// No description provided for @feedbackFormScreen$OkayRate.
  ///
  /// In ru, this message translates to:
  /// **'Нормально'**
  String get feedbackFormScreen$OkayRate;

  /// No description provided for @feedbackFormScreen$GoodRate.
  ///
  /// In ru, this message translates to:
  /// **'Хорошо'**
  String get feedbackFormScreen$GoodRate;

  /// No description provided for @feedbackFormScreen$AwesomeRate.
  ///
  /// In ru, this message translates to:
  /// **'Отлично!'**
  String get feedbackFormScreen$AwesomeRate;

  /// No description provided for @feedbackFormScreen$WhatDidYouLike.
  ///
  /// In ru, this message translates to:
  /// **'Что вам понравилось?'**
  String get feedbackFormScreen$WhatDidYouLike;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$CardInterpretations.
  ///
  /// In ru, this message translates to:
  /// **'Интерпретация карт'**
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$AppDesign.
  ///
  /// In ru, this message translates to:
  /// **'Атмосфера и дизайн приложения'**
  String get feedbackFormScreen$FeedbackCategory$AppDesign;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$Accuracy.
  ///
  /// In ru, this message translates to:
  /// **'Точность раскладов'**
  String get feedbackFormScreen$FeedbackCategory$Accuracy;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$Usability.
  ///
  /// In ru, this message translates to:
  /// **'Удобство использования'**
  String get feedbackFormScreen$FeedbackCategory$Usability;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$Variety.
  ///
  /// In ru, this message translates to:
  /// **'Разнообразие раскладов'**
  String get feedbackFormScreen$FeedbackCategory$Variety;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$Inspiration.
  ///
  /// In ru, this message translates to:
  /// **'Вдохновение и личное развитие'**
  String get feedbackFormScreen$FeedbackCategory$Inspiration;

  /// No description provided for @feedbackFormScreen$FeedbackCategory$Other.
  ///
  /// In ru, this message translates to:
  /// **'Другое'**
  String get feedbackFormScreen$FeedbackCategory$Other;

  /// No description provided for @feedbackFormScreen$Send.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get feedbackFormScreen$Send;

  /// No description provided for @feedbackFromScreen$YourComment.
  ///
  /// In ru, this message translates to:
  /// **'Ваш комментарий (необязательно)'**
  String get feedbackFromScreen$YourComment;

  /// No description provided for @feedbackFromScreen$CommentHint.
  ///
  /// In ru, this message translates to:
  /// **'Опишите ваш опыт использования приложения'**
  String get feedbackFromScreen$CommentHint;

  /// No description provided for @aboutScreen$Title.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get aboutScreen$Title;

  /// No description provided for @aboutScreen$PrivacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get aboutScreen$PrivacyPolicy;

  /// No description provided for @aboutScreen$TermsOfService.
  ///
  /// In ru, this message translates to:
  /// **'Условия использования'**
  String get aboutScreen$TermsOfService;

  /// No description provided for @share$Suggest.
  ///
  /// In ru, this message translates to:
  /// **'Попробуй {appName}! Скачай здесь:\n{appLink}'**
  String share$Suggest(Object appLink, Object appName);

  /// No description provided for @share$Title.
  ///
  /// In ru, this message translates to:
  /// **'Поделитесь нашим приложением'**
  String get share$Title;

  /// No description provided for @authScreen$Hint$Email.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get authScreen$Hint$Email;

  /// No description provided for @authScreen$Hint$Password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get authScreen$Hint$Password;

  /// No description provided for @authScreen$Hint$Name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get authScreen$Hint$Name;

  /// No description provided for @authScreen$Hint$ConfirmPassword.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите пароль'**
  String get authScreen$Hint$ConfirmPassword;

  /// No description provided for @authScreen$Label$ForgotPassword.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get authScreen$Label$ForgotPassword;

  /// No description provided for @authScreen$Label$Login.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get authScreen$Label$Login;

  /// No description provided for @authScreen$Label$SignUp.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get authScreen$Label$SignUp;

  /// No description provided for @authScreen$Label$Recover.
  ///
  /// In ru, this message translates to:
  /// **'Восстановить'**
  String get authScreen$Label$Recover;

  /// No description provided for @authScreen$Label$Back.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get authScreen$Label$Back;

  /// No description provided for @authScreen$Title$ResetYourPassword.
  ///
  /// In ru, this message translates to:
  /// **'Сбросьте пароль'**
  String get authScreen$Title$ResetYourPassword;

  /// No description provided for @authScreen$Subtitle$WeWillSendYouPass.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправим ваш пароль на этот email'**
  String get authScreen$Subtitle$WeWillSendYouPass;

  /// No description provided for @authScreen$Error$InvalidEmail.
  ///
  /// In ru, this message translates to:
  /// **'Некорректный email!'**
  String get authScreen$Error$InvalidEmail;

  /// No description provided for @authScreen$Error$PasswordDoNotMatch.
  ///
  /// In ru, this message translates to:
  /// **'Пароли не совпадают!'**
  String get authScreen$Error$PasswordDoNotMatch;

  /// No description provided for @authScreen$Success$Success.
  ///
  /// In ru, this message translates to:
  /// **'Успех'**
  String get authScreen$Success$Success;

  /// No description provided for @authScreen$Success$AnEmailSent.
  ///
  /// In ru, this message translates to:
  /// **'Письмо отправлено'**
  String get authScreen$Success$AnEmailSent;

  /// No description provided for @authScreen$Title.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get authScreen$Title;

  /// No description provided for @authScreen$Error$PasswordTooLong.
  ///
  /// In ru, this message translates to:
  /// **'Пароль слишком длинный — максимум {count} символа'**
  String authScreen$Error$PasswordTooLong(Object count);

  /// No description provided for @authScreen$Error$PasswordTooShort.
  ///
  /// In ru, this message translates to:
  /// **'Пароль слишком короткий — минимум {count} символов'**
  String authScreen$Error$PasswordTooShort(Object count);

  /// No description provided for @authScreen$Error$AtLeastOneUpper.
  ///
  /// In ru, this message translates to:
  /// **'Пароль должен содержать хотя бы одну заглавную букву'**
  String get authScreen$Error$AtLeastOneUpper;

  /// No description provided for @authScreen$Error$AtLeastOneLower.
  ///
  /// In ru, this message translates to:
  /// **'Пароль должен содержать хотя бы одну строчную букву'**
  String get authScreen$Error$AtLeastOneLower;

  /// No description provided for @authScreen$Error$AtLeastOneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Пароль должен содержать хотя бы одну цифру'**
  String get authScreen$Error$AtLeastOneNumber;

  /// No description provided for @authScreen$Error$AtLeastOneSpecCharacter.
  ///
  /// In ru, this message translates to:
  /// **'Пароль должен содержать хотя бы один специальный символ'**
  String get authScreen$Error$AtLeastOneSpecCharacter;

  /// No description provided for @authScreen$Error$Title.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get authScreen$Error$Title;

  /// No description provided for @authScreen$Error$TooShort.
  ///
  /// In ru, this message translates to:
  /// **'Текст слишком короткий — минимум {count} символов'**
  String authScreen$Error$TooShort(Object count);

  /// No description provided for @authScreen$Error$TooLong.
  ///
  /// In ru, this message translates to:
  /// **'Текст слишком длинный — максимум {count} символов'**
  String authScreen$Error$TooLong(Object count);

  /// No description provided for @authScreen$Success$AccountCreated.
  ///
  /// In ru, this message translates to:
  /// **'Аккаунт успешно создан'**
  String get authScreen$Success$AccountCreated;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'hi', 'it', 'pt', 'ru', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'it': return AppLocalizationsIt();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
