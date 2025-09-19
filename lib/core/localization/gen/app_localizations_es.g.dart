// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Bienvenido al mundo de $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Descubre las cartas para comprenderte mejor, escuchar las señales del Universo y encontrar respuestas a preguntas importantes.';

  @override
  String get onboarding$Title$Second => 'Empieza la mañana con una guía';

  @override
  String get onboarding$Subtitle$Second => 'Saca la carta del día — recibe inspiración, consejo o advertencia.';

  @override
  String get onboarding$Title$Third => 'Tu guía personal';

  @override
  String get onboarding$Subtitle$Third => 'Recibe tiradas diarias, consejos para tomar decisiones y explora más tu intuición.';

  @override
  String get onboarding$Button$Label => '¡Vamos!';

  @override
  String get homeScreen$Menu$DailyCard => 'Carta del día';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Conoce las cartas';

  @override
  String get homeScreen$Menu$YesNo => 'Sí o No';

  @override
  String get profileScreen$Title => 'Perfil';

  @override
  String get profileScreen$Subscription => 'Suscripción';

  @override
  String get profileScreen$ChooseSubscription => 'Elegir suscripción';

  @override
  String get profileScreen$SuggestSubscription => '¿Sin suscripción? Vamos a encontrar una';

  @override
  String get profileScreen$LoginButton$Label => 'Acceder';

  @override
  String get settingsScreen$Title => 'Ajustes';

  @override
  String get settingsScreen$EditProfile => 'Editar perfil';

  @override
  String get settingsScreen$ManageSubscription => 'Gestionar suscripción';

  @override
  String get settingsScreen$App => 'Aplicación';

  @override
  String get settingsScreen$ChangeLanguage => 'Cambiar idioma';

  @override
  String get settingsScreen$ChangeTheme => 'Tema';

  @override
  String get settingsScreen$AboutApp => 'Acerca de la aplicación';

  @override
  String get settingsScreen$FeedbackForm => 'Formulario de comentarios';

  @override
  String get settingsScreen$LogOut => 'Cerrar sesión';

  @override
  String get settingsScreen$Theme$Light => 'Siempre claro';

  @override
  String get settingsScreen$Theme$Dark => 'Siempre oscuro';

  @override
  String get settingsScreen$Theme$System => 'Como el sistema';

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
  String get feedbackFormScreen$Title => 'Formulario de comentarios';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Comparte tu opinión';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Tu experiencia';

  @override
  String get feedbackFormScreen$TerribleRate => 'Terrible';

  @override
  String get feedbackFormScreen$BadRate => 'Malo';

  @override
  String get feedbackFormScreen$OkayRate => 'Normal';

  @override
  String get feedbackFormScreen$GoodRate => 'Bueno';

  @override
  String get feedbackFormScreen$AwesomeRate => '¡Excelente!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => '¿Qué te gustó?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Interpretaciones de cartas';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'Atmósfera y diseño de la app';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Precisión de las tiradas';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Facilidad de uso';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Variedad de tiradas';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Inspiración y desarrollo personal';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Otro';

  @override
  String get feedbackFormScreen$Send => 'Enviar';

  @override
  String get feedbackFromScreen$YourComment => 'Tu comentario (opcional)';

  @override
  String get feedbackFromScreen$CommentHint => 'Describe tu experiencia con la aplicación';

  @override
  String get aboutScreen$Title => 'Acerca de';

  @override
  String get aboutScreen$PrivacyPolicy => 'Política de privacidad';

  @override
  String get aboutScreen$TermsOfService => 'Términos de servicio';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return '¡Prueba $appName! Descárgalo aquí:\n$appLink';
  }

  @override
  String get share$Title => 'Comparte nuestra aplicación';

  @override
  String get authScreen$Hint$Email => 'Correo electrónico';

  @override
  String get authScreen$Hint$Password => 'Contraseña';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Confirmar contraseña';

  @override
  String get authScreen$Label$ForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authScreen$Label$Login => 'Acceder';

  @override
  String get authScreen$Label$SignUp => 'Registrarse';

  @override
  String get authScreen$Label$Recover => 'Recuperar';

  @override
  String get authScreen$Label$Back => 'Atrás';

  @override
  String get authScreen$Title$ResetYourPassword => 'Restablecer contraseña';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'Enviaremos tu contraseña a este correo';

  @override
  String get authScreen$Error$InvalidEmail => '¡Correo no válido!';

  @override
  String get authScreen$Error$PasswordIsTooShort => 'Пароль слишком короткий!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => '¡Las contraseñas no coinciden!';

  @override
  String get authScreen$Success$Success => 'Éxito';

  @override
  String get authScreen$Success$AnEmailSent => 'Se ha enviado un correo';

  @override
  String get authScreen$Title => '¡Bienvenido!';

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'La contraseña es demasiado larga — máximo $count caracteres';
  }

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'La contraseña es demasiado corta — mínimo $count caracteres';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'La contraseña debe contener al menos una letra mayúscula';

  @override
  String get authScreen$Error$AtLeastOneLower => 'La contraseña debe contener al menos una letra minúscula';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'La contraseña debe contener al menos un número';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'La contraseña debe contener al menos un carácter especial';
}
