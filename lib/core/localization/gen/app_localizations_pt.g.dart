// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get onboarding$Path => 'A jornada começa aqui';

  @override
  String get onboarding$Answer => 'A resposta já está\ndentro de você';

  @override
  String get onboarding$Cards => 'As cartas vão te ajudar\na enxergá-la';

  @override
  String get onboarding$Skip => 'Pular';

  @override
  String get onboarding$Start => 'Começar';

  @override
  String get homeScreen$Menu$DailyCard => 'Carta do dia';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Conheça as cartas';

  @override
  String get homeScreen$Menu$YesNo => 'Sim ou Não';

  @override
  String get profileScreen$Title => 'Perfil';

  @override
  String get profileScreen$Subscription => 'Assinatura';

  @override
  String get profileScreen$ChooseSubscription => 'Escolher assinatura';

  @override
  String get profileScreen$SuggestSubscription => 'Sem assinatura? Vamos encontrar uma';

  @override
  String get settingsScreen$Title => 'Configurações';

  @override
  String get settingsScreen$EditProfile => 'Editar perfil';

  @override
  String get settingsScreen$ManageSubscription => 'Gerenciar assinatura';

  @override
  String get settingsScreen$App => 'Aplicativo';

  @override
  String get settingsScreen$ChangeLanguage => 'Mudar idioma';

  @override
  String get settingsScreen$ChangeTheme => 'Tema';

  @override
  String get settingsScreen$AboutApp => 'Sobre o app';

  @override
  String get settingsScreen$FeedbackForm => 'Formulário de feedback';

  @override
  String get settingsScreen$LogOut => 'Sair';

  @override
  String get settingsScreen$Theme$Light => 'Sempre claro';

  @override
  String get settingsScreen$Theme$Dark => 'Sempre escuro';

  @override
  String get settingsScreen$Theme$System => 'Como o sistema';

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
  String get feedbackFormScreen$Title => 'Formulário de feedback';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Compartilhe seu feedback';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Sua experiência';

  @override
  String get feedbackFormScreen$TerribleRate => 'Terrível';

  @override
  String get feedbackFormScreen$BadRate => 'Ruim';

  @override
  String get feedbackFormScreen$OkayRate => 'Regular';

  @override
  String get feedbackFormScreen$GoodRate => 'Bom';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Incrível!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'O que você gostou?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Interpretação das cartas';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Atmosfera e design do app';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Precisão das tiragens';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Facilidade de uso';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Variedade de tiragens';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Inspiração e crescimento pessoal';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Outro';

  @override
  String get feedbackFormScreen$Send => 'Enviar';

  @override
  String get feedbackFromScreen$YourComment => 'Seu comentário (opcional)';

  @override
  String get feedbackFromScreen$CommentHint => 'Descreva sua experiência com o app';

  @override
  String get aboutScreen$Title => 'Sobre';

  @override
  String get aboutScreen$PrivacyPolicy => 'Política de Privacidade';

  @override
  String get aboutScreen$TermsOfService => 'Termos de Serviço';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Experimente $appName! Baixe aqui: $appLink';
  }
}
