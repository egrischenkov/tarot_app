// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get common$Error => 'Что-то пошло не так. Пожалуйста, попробуйте позже.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Добро пожаловать в мир $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Откройте карты, чтобы лучше понять себя, услышать подсказки Вселенной и найти ответы на важные вопросы.';

  @override
  String get onboarding$Title$Second => 'Начинайте утро с подсказки';

  @override
  String get onboarding$Subtitle$Second => 'Тяните карту дня — и получайте вдохновение, совет или предостережение.';

  @override
  String get onboarding$Title$Third => 'Ваш личный проводник';

  @override
  String get onboarding$Subtitle$Third => 'Получайте ежедневные расклады, советы для принятия решений и глубже исследуйте свою интуицию.';

  @override
  String get onboarding$Button$Label => 'Поехали';

  @override
  String get homeScreen$Menu$DailyCard => 'Карта дня';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Узнай карты';

  @override
  String get homeScreen$Menu$YesNo => 'Да или Нет';

  @override
  String get profileScreen$Title => 'Профиль';

  @override
  String get profileScreen$Subscription => 'Подписка';

  @override
  String get profileScreen$ChooseSubscription => 'Выбрать подписку';

  @override
  String get profileScreen$SuggestSubscription => 'Нет подписки? Давай подберем';

  @override
  String get profileScreen$LoginButton$Label => 'Вход';

  @override
  String get profileScreen$AddInfo$Title => 'Заполните профиль, чтобы открыть больше возможностей!';

  @override
  String get profileScreen$AddInfo$Subtitle => 'Добавьте дату рождения, пол, семейное положение и даже информацию о работе — и приложение будет подбирать для вас персональные карты дня, расклады и прогнозы, созданные специально под ваш профиль.';

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

  @override
  String get settingsScreen$Language$Ru => 'Русский';

  @override
  String get settingsScreen$Language$En => 'English';

  @override
  String get settingsScreen$Language$De => 'Deutsch';

  @override
  String get settingsScreen$Language$Es => 'Español';

  @override
  String get settingsScreen$Language$Fr => 'Français';

  @override
  String get settingsScreen$Language$Hi => 'हिन्दी';

  @override
  String get settingsScreen$Language$It => 'Italiano';

  @override
  String get settingsScreen$Language$Pt => 'Português';

  @override
  String get settingsScreen$Language$Zh => '中文';

  @override
  String get feedbackFormScreen$Title => 'Форма обратной связи';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Поделитесь вашим фидбеком';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Ваше впечатление';

  @override
  String get feedbackFormScreen$TerribleRate => 'Ужасно';

  @override
  String get feedbackFormScreen$BadRate => 'Плохо';

  @override
  String get feedbackFormScreen$OkayRate => 'Нормально';

  @override
  String get feedbackFormScreen$GoodRate => 'Хорошо';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Отлично!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'Что вам понравилось?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Интерпретация карт';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Атмосфера и дизайн приложения';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Точность раскладов';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Удобство использования';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Разнообразие раскладов';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Вдохновение и личное развитие';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Другое';

  @override
  String get feedbackFormScreen$Send => 'Отправить';

  @override
  String get feedbackFromScreen$YourComment => 'Ваш комментарий (необязательно)';

  @override
  String get feedbackFromScreen$CommentHint => 'Опишите ваш опыт использования приложения';

  @override
  String get aboutScreen$Title => 'О приложении';

  @override
  String get aboutScreen$PrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get aboutScreen$TermsOfService => 'Условия использования';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Попробуй $appName! Скачай здесь:\n$appLink';
  }

  @override
  String get share$Title => 'Поделитесь нашим приложением';

  @override
  String get authScreen$Hint$Email => 'Email';

  @override
  String get authScreen$Hint$Password => 'Пароль';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Подтвердите пароль';

  @override
  String get authScreen$Label$ForgotPassword => 'Забыли пароль?';

  @override
  String get authScreen$Label$Login => 'Вход';

  @override
  String get authScreen$Label$SignUp => 'Регистрация';

  @override
  String get authScreen$Label$Recover => 'Восстановить';

  @override
  String get authScreen$Label$Back => 'Назад';

  @override
  String get authScreen$Title$ResetYourPassword => 'Сбросьте пароль';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Мы отправим ваш пароль на этот email';

  @override
  String get authScreen$Error$InvalidEmail => 'Некорректный email!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'Пароли не совпадают!';

  @override
  String get authScreen$Success$Success => 'Успех';

  @override
  String get authScreen$Success$AnEmailSent => 'Письмо отправлено';

  @override
  String get authScreen$Title => 'Добро пожаловать!';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'Пароль слишком длинный — максимум $count символа';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'Пароль слишком короткий — минимум $count символов';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'Пароль должен содержать хотя бы одну заглавную букву';

  @override
  String get authScreen$Error$AtLeastOneLower => 'Пароль должен содержать хотя бы одну строчную букву';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'Пароль должен содержать хотя бы одну цифру';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'Пароль должен содержать хотя бы один специальный символ';

  @override
  String get authScreen$Error$Title => 'Ошибка';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'Текст слишком короткий — минимум $count символов';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'Текст слишком длинный — максимум $count символов';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Аккаунт успешно создан';
}
