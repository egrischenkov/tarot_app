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
  String get common$Error => 'Etwas ist schiefgelaufen. Bitte versuche es später noch einmal.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Willkommen in der Welt von $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Entdecke die Karten, um dich selbst besser zu verstehen, Hinweise des Universums zu hören und Antworten auf wichtige Fragen zu finden.';

  @override
  String get onboarding$Title$Second => 'Beginne deinen Morgen mit einer Botschaft';

  @override
  String get onboarding$Subtitle$Second => 'Ziehe die Karte des Tages — erhalte Inspiration, Rat oder eine Warnung.';

  @override
  String get onboarding$Title$Third => 'Dein persönlicher Begleiter';

  @override
  String get onboarding$Subtitle$Third => 'Erhalte tägliche Legungen, Entscheidungshilfen und erforsche deine Intuition tiefer.';

  @override
  String get onboarding$Button$Label => 'Los!';

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
  String get profileScreen$LoginButton$Label => 'Login';

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
    return 'Probiere $appName aus! Lade es hier herunter:\n$appLink';
  }

  @override
  String get share$Title => 'Teile unsere App';

  @override
  String get authScreen$Hint$Email => 'E-Mail';

  @override
  String get authScreen$Hint$Password => 'Passwort';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Passwort bestätigen';

  @override
  String get authScreen$Label$ForgotPassword => 'Passwort vergessen?';

  @override
  String get authScreen$Label$Login => 'Login';

  @override
  String get authScreen$Label$SignUp => 'Registrieren';

  @override
  String get authScreen$Label$Recover => 'Wiederherstellen';

  @override
  String get authScreen$Label$Back => 'Zurück';

  @override
  String get authScreen$Title$ResetYourPassword => 'Passwort zurücksetzen';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Wir senden Ihr Passwort an diese E-Mail';

  @override
  String get authScreen$Error$InvalidEmail => 'Ungültige E-Mail!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'Passwörter stimmen nicht überein!';

  @override
  String get authScreen$Success$Success => 'Erfolg';

  @override
  String get authScreen$Success$AnEmailSent => 'Eine E-Mail wurde gesendet';

  @override
  String get authScreen$Title => 'Willkommen!';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'Passwort ist zu lang — maximal $count Zeichen';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'Passwort ist zu kurz — mindestens $count Zeichen';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'Passwort muss mindestens einen Großbuchstaben enthalten';

  @override
  String get authScreen$Error$AtLeastOneLower => 'Passwort muss mindestens einen Kleinbuchstaben enthalten';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'Passwort muss mindestens eine Zahl enthalten';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'Passwort muss mindestens ein Sonderzeichen enthalten';

  @override
  String get authScreen$Error$Title => 'Fehler';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'Text ist zu kurz — mindestens $count Zeichen';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'Text ist zu lang — maximal $count Zeichen';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Konto erfolgreich erstellt';
}
