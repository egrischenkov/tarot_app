import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/profile/ui/bloc/auth/auth_bloc.dart';
import 'package:taro/features/profile/ui/utils/auth_fields_validator.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  final AuthBloc authBloc;

  const AuthScreen({
    required this.authBloc,
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final fieldsValidator = AuthFieldsValidator(context: context);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;
    final l10n = context.l10n;

    return Stack(
      children: [
        FlutterLogin(
          title: l10n.authScreen$Title,
          theme: LoginTheme(
            titleStyle: fonts.largeTitleEmphasized,
            prefixIconColor: colors.icon,
            suffixIconColor: colors.icon,
            labelStyle: context.fonts.bodyRegular.copyWith(
              color: colors.textDisabled,
            ),
            pageColorDark: colors.accentTertiary,
            pageColorLight: colors.accent,
            buttonTheme: LoginButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x4),
              ),
              backgroundColor: colors.accent,
              iconColor: colors.text,
              splashColor: context.colors.accentSecondary.withBrightness(1.5),
              elevation: 0,
            ),
            textFieldStyle: fonts.bodyRegular,
            buttonStyle: fonts.bodyEmphasized.copyWith(color: colors.buttonText),
            cardTheme: CardTheme(
              color: colors.background,
            ),
            bodyStyle: fonts.xsLabel.copyWith(
              fontSize: 15,
              color: colors.textDisabled,
            ),
            inputTheme: InputDecorationTheme(
              counterStyle: fonts.bodyEmphasized,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x3),
                borderSide: BorderSide(
                  color: colors.error,
                  width: UiKitSize.base / 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x3),
                borderSide: BorderSide(
                  color: colors.border,
                  width: UiKitSize.base / 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x3),
                borderSide: BorderSide(
                  color: colors.border,
                  width: UiKitSize.base / 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x3),
                borderSide: BorderSide(
                  color: colors.disabled,
                  width: UiKitSize.base / 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UiKitRadius.x3),
                borderSide: BorderSide(
                  color: colors.border,
                  width: UiKitSize.base / 2,
                ),
              ),
              hintStyle: fonts.xsLabel.copyWith(color: colors.textDisabled),
              floatingLabelStyle: fonts.xsLabel.copyWith(color: colors.textDisabled),
              errorStyle: fonts.xsLabel.copyWith(color: colors.error, fontWeight: FontWeight.w600),
            ),
          ),
          messages: LoginMessages(
            loginButton: l10n.authScreen$Label$Login,
            userHint: l10n.authScreen$Hint$Email,
            passwordHint: l10n.authScreen$Hint$Password,
            confirmPasswordHint: l10n.authScreen$Hint$ConfirmPassword,
            forgotPasswordButton: l10n.authScreen$Label$ForgotPassword,
            signupButton: l10n.authScreen$Label$SignUp,
            recoverPasswordIntro: l10n.authScreen$Title$ResetYourPassword,
            recoverPasswordDescription: l10n.authScreen$Subtitle$WeWillSendYouPass,
            recoverPasswordButton: l10n.authScreen$Label$Recover,
            goBackButton: l10n.authScreen$Label$Back,
            signUpSuccess: l10n.authScreen$Success$Success,
            flushbarTitleSuccess: l10n.authScreen$Success$Success,
            recoverPasswordSuccess: l10n.authScreen$Success$AnEmailSent,
            confirmPasswordError: l10n.authScreen$Error$PasswordDoNotMatch,
            flushbarTitleError: l10n.authScreen$Error$Title,
          ),
          userValidator: fieldsValidator.userFieldValidator,
          passwordValidator: fieldsValidator.passwordFieldValidator,
          onLogin: (_) {
            return Future.value();
          },
          onRecoverPassword: (_) {
            return Future.value();
          },
          onSignup: (_) {
            return Future.value();
          },
          headerWidget: LottieBuilder.asset(Assets.lottie.signUp),
        ),
        Positioned(
          left: UiKitSpacing.x4,
          top: MediaQuery.of(context).padding.top + UiKitSpacing.x4,
          child: UiKitBackButton(onTap: context.router.pop),
        ),
      ],
    );
  }
}
