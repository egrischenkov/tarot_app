// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get onboarding$Path => 'Le chemin commence ici';

  @override
  String get onboarding$Answer => 'La réponse est déjà\nen toi';

  @override
  String get onboarding$Cards => 'Les cartes t’aideront\nà la voir';

  @override
  String get onboarding$Skip => 'Passer';

  @override
  String get onboarding$Start => 'Commencer';

  @override
  String get homeScreen$Menu$DailyCard => 'Carte du jour';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Découvrir les cartes';

  @override
  String get homeScreen$Menu$YesNo => 'Oui ou Non';

  @override
  String get profileScreen$Title => 'Profil';

  @override
  String get profileScreen$Subscription => 'Abonnement';

  @override
  String get profileScreen$ChooseSubscription => 'Choisir un abonnement';

  @override
  String get profileScreen$SuggestSubscription => 'Pas d’abonnement ? Trouvons-en un';

  @override
  String get settingsScreen$Title => 'Paramètres';

  @override
  String get settingsScreen$EditProfile => 'Modifier le profil';

  @override
  String get settingsScreen$ManageSubscription => 'Gérer l’abonnement';

  @override
  String get settingsScreen$App => 'Application';

  @override
  String get settingsScreen$ChangeLanguage => 'Changer de langue';

  @override
  String get settingsScreen$ChangeTheme => 'Thème';

  @override
  String get settingsScreen$AboutApp => 'À propos de l’application';

  @override
  String get settingsScreen$FeedbackForm => 'Formulaire de retour';

  @override
  String get settingsScreen$LogOut => 'Se déconnecter';

  @override
  String get settingsScreen$Theme$Light => 'Toujours clair';

  @override
  String get settingsScreen$Theme$Dark => 'Toujours sombre';

  @override
  String get settingsScreen$Theme$System => 'Comme le système';

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
  String get feedbackFormScreen$Title => 'Formulaire de retour';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Partage ton avis';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Ton expérience';

  @override
  String get feedbackFormScreen$TerribleRate => 'Terrible';

  @override
  String get feedbackFormScreen$BadRate => 'Mauvais';

  @override
  String get feedbackFormScreen$OkayRate => 'Moyen';

  @override
  String get feedbackFormScreen$GoodRate => 'Bon';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Excellent !';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'Qu’as-tu aimé ?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Interprétations des cartes';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Atmosphère & design de l’application';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Précision des tirages';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Facilité d’utilisation';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Variété des tirages';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Inspiration & développement personnel';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Autre';

  @override
  String get feedbackFormScreen$Send => 'Envoyer';

  @override
  String get feedbackFromScreen$YourComment => 'Ton commentaire (optionnel)';

  @override
  String get feedbackFromScreen$CommentHint => 'Décris ton expérience avec l’application';

  @override
  String get aboutScreen$Title => 'ऐप के बारे में';

  @override
  String get aboutScreen$PrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get aboutScreen$TermsOfService => 'सेवा की शर्तें';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Essaie $appName ! Télécharge-le ici : $appLink';
  }
}
