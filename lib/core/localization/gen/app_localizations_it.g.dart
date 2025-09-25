// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get common$Error => 'Qualcosa è andato storto. Per favore riprova più tardi.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Benvenuto nel mondo di $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Scopri le carte per comprendere meglio te stesso, ascoltare i segnali dell’Universo e trovare risposte a domande importanti.';

  @override
  String get onboarding$Title$Second => 'Inizia la mattina con un consiglio';

  @override
  String get onboarding$Subtitle$Second => 'Pesca la carta del giorno — ricevi ispirazione, consigli o avvertimenti.';

  @override
  String get onboarding$Title$Third => 'La tua guida personale';

  @override
  String get onboarding$Subtitle$Third => 'Ricevi letture quotidiane, suggerimenti per le decisioni ed esplora più a fondo la tua intuizione.';

  @override
  String get onboarding$Button$Label => 'Via!';

  @override
  String get homeScreen$Menu$DailyCard => 'Carta del giorno';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Scopri le carte';

  @override
  String get homeScreen$Menu$YesNo => 'Sì o No';

  @override
  String get profileScreen$Title => 'Profilo';

  @override
  String get profileScreen$Subscription => 'Abbonamento';

  @override
  String get profileScreen$ChooseSubscription => 'Scegli un abbonamento';

  @override
  String get profileScreen$SuggestSubscription => 'Nessun abbonamento? Troviamone uno';

  @override
  String get profileScreen$LoginButton$Label => 'Accedi';

  @override
  String get profileScreen$AddInfo$Title => 'Completa il tuo profilo per sbloccare più funzionalità!';

  @override
  String get profileScreen$AddInfo$Subtitle => 'Aggiungi data di nascita, sesso, stato civile e persino informazioni sul lavoro — l\'app selezionerà carte del giorno, stese e previsioni personalizzate per te.';

  @override
  String get settingsScreen$Title => 'Impostazioni';

  @override
  String get settingsScreen$EditProfile => 'Modifica profilo';

  @override
  String get settingsScreen$ManageSubscription => 'Gestisci abbonamento';

  @override
  String get settingsScreen$App => 'App';

  @override
  String get settingsScreen$ChangeLanguage => 'Cambia lingua';

  @override
  String get settingsScreen$ChangeTheme => 'Tema';

  @override
  String get settingsScreen$AboutApp => 'Informazioni sull’app';

  @override
  String get settingsScreen$FeedbackForm => 'Modulo di feedback';

  @override
  String get settingsScreen$LogOut => 'Esci';

  @override
  String get settingsScreen$Theme$Light => 'Sempre chiaro';

  @override
  String get settingsScreen$Theme$Dark => 'Sempre scuro';

  @override
  String get settingsScreen$Theme$System => 'Come sistema';

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
  String get feedbackFormScreen$Title => 'Modulo di feedback';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Condividi il tuo feedback';

  @override
  String get feedbackFormScreen$RateYourExperience => 'La tua esperienza';

  @override
  String get feedbackFormScreen$TerribleRate => 'Terribile';

  @override
  String get feedbackFormScreen$BadRate => 'Scarso';

  @override
  String get feedbackFormScreen$OkayRate => 'Normale';

  @override
  String get feedbackFormScreen$GoodRate => 'Buono';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Fantastico!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'Cosa ti è piaciuto?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Interpretazioni delle carte';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Atmosfera e design dell’app';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Precisione delle stese';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Facilità d’uso';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Varietà delle stese';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Ispirazione e crescita personale';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Altro';

  @override
  String get feedbackFormScreen$Send => 'Invia';

  @override
  String get feedbackFromScreen$YourComment => 'Il tuo commento (opzionale)';

  @override
  String get feedbackFromScreen$CommentHint => 'Descrivi la tua esperienza con l’app';

  @override
  String get aboutScreen$Title => 'Informazioni';

  @override
  String get aboutScreen$PrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get aboutScreen$TermsOfService => 'Termini di servizio';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Prova $appName! Scaricalo qui:\n$appLink';
  }

  @override
  String get share$Title => 'Condividi la nostra app';

  @override
  String get authScreen$Hint$Email => 'Email';

  @override
  String get authScreen$Hint$Password => 'Password';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Conferma password';

  @override
  String get authScreen$Label$ForgotPassword => 'Password dimenticata?';

  @override
  String get authScreen$Label$Login => 'Accedi';

  @override
  String get authScreen$Label$SignUp => 'Registrati';

  @override
  String get authScreen$Label$Recover => 'Recupera';

  @override
  String get authScreen$Label$Back => 'Indietro';

  @override
  String get authScreen$Title$ResetYourPassword => 'Reimposta la password';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Invieremo la tua password a questa email';

  @override
  String get authScreen$Error$InvalidEmail => 'Email non valida!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'Le password non coincidono!';

  @override
  String get authScreen$Success$Success => 'Successo';

  @override
  String get authScreen$Success$AnEmailSent => 'È stata inviata un\'email';

  @override
  String get authScreen$Title => 'Benvenuto!';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'La password è troppo lunga — massimo $count caratteri';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'La password è troppo corta — minimo $count caratteri';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'La password deve contenere almeno una lettera maiuscola';

  @override
  String get authScreen$Error$AtLeastOneLower => 'La password deve contenere almeno una lettera minuscola';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'La password deve contenere almeno un numero';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'La password deve contenere almeno un carattere speciale';

  @override
  String get authScreen$Error$Title => 'Errore';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'Il testo è troppo corto — minimo $count caratteri';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'Il testo è troppo lungo — massimo $count caratteri';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Account creato con successo';
}
