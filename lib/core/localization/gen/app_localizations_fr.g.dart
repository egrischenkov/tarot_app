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
  String get common$Error => 'Une erreur s\'est produite. Veuillez réessayer plus tard.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Bienvenue dans l’univers de $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Découvrez les cartes pour mieux vous comprendre, entendre les messages de l’Univers et trouver des réponses à vos questions importantes.';

  @override
  String get onboarding$Title$Second => 'Commencez la matinée avec un conseil';

  @override
  String get onboarding$Subtitle$Second => 'Tirez la carte du jour — recevez inspiration, conseils ou avertissements.';

  @override
  String get onboarding$Title$Third => 'Votre guide personnel';

  @override
  String get onboarding$Subtitle$Third => 'Recevez des tirages quotidiens, des conseils pour vos décisions et explorez plus profondément votre intuition.';

  @override
  String get onboarding$Button$Label => 'Allez!';

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
  String get profileScreen$LoginButton$Label => 'Connexion';

  @override
  String get profileScreen$AddInfo$Title => 'Complétez votre profil pour débloquer plus de fonctionnalités !';

  @override
  String get profileScreen$AddInfo$Subtitle => 'Ajoutez votre date de naissance, sexe, situation familiale et même des informations professionnelles — l’application vous proposera des cartes du jour, tirages et prévisions personnalisés.';

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
    return 'Essaie $appName ! Télécharge-le ici :\n$appLink';
  }

  @override
  String get share$Title => 'Partagez notre application';

  @override
  String get authScreen$Hint$Email => 'Email';

  @override
  String get authScreen$Hint$Password => 'Mot de passe';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get authScreen$Label$ForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authScreen$Label$Login => 'Connexion';

  @override
  String get authScreen$Label$SignUp => 'Inscription';

  @override
  String get authScreen$Label$Recover => 'Récupérer';

  @override
  String get authScreen$Label$Back => 'Retour';

  @override
  String get authScreen$Title$ResetYourPassword => 'Réinitialiser le mot de passe';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Nous enverrons votre mot de passe à cet email';

  @override
  String get authScreen$Error$InvalidEmail => 'Email invalide !';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'Les mots de passe ne correspondent pas !';

  @override
  String get authScreen$Success$Success => 'Succès';

  @override
  String get authScreen$Success$AnEmailSent => 'Un email a été envoyé';

  @override
  String get authScreen$Title => 'Bienvenue !';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'Le mot de passe est trop long — maximum $count caractères';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'Le mot de passe est trop court — minimum $count caractères';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'Le mot de passe doit contenir au moins une majuscule';

  @override
  String get authScreen$Error$AtLeastOneLower => 'Le mot de passe doit contenir au moins une minuscule';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'Le mot de passe doit contenir au moins un chiffre';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'Le mot de passe doit contenir au moins un caractère spécial';

  @override
  String get authScreen$Error$Title => 'Erreur';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'Le texte est trop court — minimum $count caractères';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'Le texte est trop long — maximum $count caractères';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Compte créé avec succès';
}
