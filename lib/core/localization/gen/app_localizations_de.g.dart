// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get onboarding$Path => 'Der Weg beginnt hier';

  @override
  String get onboarding$Answer => 'Die Antwort liegt bereits\nin dir';

  @override
  String get onboarding$Cards => 'Die Karten helfen dir,\nsie zu erkennen';

  @override
  String get onboarding$Skip => 'Überspringen';

  @override
  String get onboarding$Start => 'Los geht’s';

  @override
  String get homeScreen$Menu$DailyCard => 'Tageskarte';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Lerne die Karten kennen';

  @override
  String get homeScreen$Menu$YesNo => 'Ja oder Nein';

  @override
  String get profileScreen$Title => 'Profil';

  @override
  String get profileScreen$Subscription => 'Abonnement';

  @override
  String get profileScreen$ChooseSubscription => 'Abonnement wählen';

  @override
  String get profileScreen$SuggestSubscription => 'Kein Abo? Lass uns eins finden';

  @override
  String get settingsScreen$Title => 'Einstellungen';

  @override
  String get settingsScreen$EditProfile => 'Profil bearbeiten';

  @override
  String get settingsScreen$ManageSubscription => 'Abo verwalten';

  @override
  String get settingsScreen$App => 'App';

  @override
  String get settingsScreen$ChangeLanguage => 'Sprache ändern';

  @override
  String get settingsScreen$ChangeTheme => 'Design';

  @override
  String get settingsScreen$AboutApp => 'Über die App';

  @override
  String get settingsScreen$FeedbackForm => 'Feedback-Formular';

  @override
  String get settingsScreen$LogOut => 'Abmelden';

  @override
  String get settingsScreen$Theme$Light => 'Immer hell';

  @override
  String get settingsScreen$Theme$Dark => 'Immer dunkel';

  @override
  String get settingsScreen$Theme$System => 'Systemstandard';

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
  String get feedbackFormScreen$Title => 'Feedback-Formular';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Teile dein Feedback';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Dein Erlebnis';

  @override
  String get feedbackFormScreen$TerribleRate => 'Schrecklich';

  @override
  String get feedbackFormScreen$BadRate => 'Schlecht';

  @override
  String get feedbackFormScreen$OkayRate => 'Okay';

  @override
  String get feedbackFormScreen$GoodRate => 'Gut';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Großartig!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'Was hat dir gefallen?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Karteninterpretationen';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Atmosphäre & Design der App';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Genauigkeit der Legungen';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Benutzerfreundlichkeit';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Vielfalt der Legungen';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Inspiration & persönliche Entwicklung';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Sonstiges';

  @override
  String get feedbackFormScreen$Send => 'Senden';

  @override
  String get feedbackFromScreen$YourComment => 'Dein Kommentar (optional)';

  @override
  String get feedbackFromScreen$CommentHint => 'Beschreibe deine Erfahrung mit der App';

  @override
  String get aboutScreen$Title => 'Über die App';

  @override
  String get aboutScreen$PrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get aboutScreen$TermsOfService => 'Nutzungsbedingungen';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Probiere $appName aus! Lade es hier herunter: $appLink';
  }
}
