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
  String get common$Error => 'Algo deu errado. Por favor, tente novamente mais tarde.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Bem-vindo ao mundo de $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Revele as cartas para se entender melhor, ouvir os sinais do Universo e encontrar respostas para questões importantes.';

  @override
  String get onboarding$Title$Second => 'Comece sua manhã com uma dica';

  @override
  String get onboarding$Subtitle$Second => 'Tire a carta do dia — receba inspiração, conselho ou alerta.';

  @override
  String get onboarding$Title$Third => 'Seu guia pessoal';

  @override
  String get onboarding$Subtitle$Third => 'Receba tiragens diárias, dicas para decisões e explore mais a sua intuição.';

  @override
  String get onboarding$Button$Label => 'Bora!';

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
  String get profileScreen$LoginButton$Label => 'Entrar';

  @override
  String get profileScreen$AddInfo$Title => 'Complete seu perfil para desbloquear mais recursos!';

  @override
  String get profileScreen$AddInfo$Subtitle => 'Adicione data de nascimento, gênero, estado civil e até informações de trabalho — o app selecionará cartas do dia, tiragens e previsões personalizadas para você.';

  @override
  String get profileScreen$JoinUs => 'Junte-se a nós — e as cartas falarão só para você';

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
    return 'Experimente $appName! Baixe aqui:\n$appLink';
  }

  @override
  String get share$Title => 'Compartilhe nosso app';

  @override
  String get authScreen$Hint$Email => 'Email';

  @override
  String get authScreen$Hint$Password => 'Senha';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Confirmar senha';

  @override
  String get authScreen$Label$ForgotPassword => 'Esqueceu a senha?';

  @override
  String get authScreen$Label$Login => 'Entrar';

  @override
  String get authScreen$Label$SignUp => 'Cadastrar-se';

  @override
  String get authScreen$Label$Recover => 'Recuperar';

  @override
  String get authScreen$Label$Back => 'Voltar';

  @override
  String get authScreen$Title$ResetYourPassword => 'Redefina sua senha';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Enviaremos sua senha para este email';

  @override
  String get authScreen$Error$InvalidEmail => 'Email inválido!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'As senhas não coincidem!';

  @override
  String get authScreen$Success$Success => 'Sucesso';

  @override
  String get authScreen$Success$AnEmailSent => 'Um email foi enviado';

  @override
  String get authScreen$Title => 'Bem-vindo!';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'A senha é muito longa — máximo de $count caracteres';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'A senha é muito curta — mínimo de $count caracteres';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'A senha deve conter pelo menos uma letra maiúscula';

  @override
  String get authScreen$Error$AtLeastOneLower => 'A senha deve conter pelo menos uma letra minúscula';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'A senha deve conter pelo menos um número';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'A senha deve conter pelo menos um caractere especial';

  @override
  String get authScreen$Error$Title => 'Erro';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'O texto é muito curto — mínimo de $count caracteres';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'O texto é muito longo — máximo de $count caracteres';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Conta criada com sucesso';
}
