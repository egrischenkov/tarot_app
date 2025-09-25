import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';
import 'package:taro/features/profile/ui/utils/auth_fields_validator.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  final ProfileBloc authBloc;

  const AuthScreen({
    required this.authBloc,
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final profileBloc = context.read<ProfileBloc>();
  late final router = context.router;

  late final fieldsValidator = AuthFieldsValidator(context: context);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;
    final l10n = context.l10n;

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      child: Stack(
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
              cardTopPosition: 200,
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
              nameHint: l10n.authScreen$Hint$Name,
              confirmSignupSuccess: l10n.authScreen$Success$AccountCreated,
            ),
            userValidator: fieldsValidator.emailFieldValidator,
            passwordValidator: fieldsValidator.passwordFieldValidator,
            nameValidator: fieldsValidator.nameFieldValidator,
            onLogin: _waitForLoginResult,
            onConfirmSignup: _waitForConfirmationResult,
            onRecoverPassword: (_) {
              return Future.value();
            },
            onSignup: _waitForSignUpResult,
            headerWidget: LottieBuilder.asset(Assets.lottie.signUp),
            children: [LottieBuilder.asset(Assets.lottie.onboardingBg2)],
          ),
          Positioned(
            left: UiKitSpacing.x4,
            top: MediaQuery.of(context).padding.top + UiKitSpacing.x4,
            child: UiKitBackButton(onTap: context.router.pop),
          ),
        ],
      ),
    );
  }

  Future<String?> _waitForLoginResult(LoginData data) {
    final completer = Completer<String?>();

    profileBloc.add(ProfileEvent.loggedIn(email: data.name, password: data.password));

    final subscription = profileBloc.stream.listen((state) {
      state.mapOrNull(
        authenticated: (state) {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
        },
        error: (state) {
          if (!completer.isCompleted) {
            // TODO(egrischenkov): pass error message from state when backend will be ready
            completer.complete('Error');
          }
        },
      );
    });

    return completer.future
      ..whenComplete(() {
        subscription.cancel();
      })
      ..then((value) {
        if (value == null) {
          router.pop();
        }
      });
  }

  Future<String?> _waitForSignUpResult(SignupData data) {
    final completer = Completer<String?>();

    profileBloc.add(
      ProfileEvent.signedUp(
        email: data.name,
        name: data.name,
        password: data.password,
      ),
    );

    final subscription = profileBloc.stream.listen((state) {
      state.mapOrNull(
        idle: (state) {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
        },
        error: (state) {
          if (!completer.isCompleted) {
            // TODO(egrischenkov): pass error message from state when backend will be ready
            completer.complete('Error');
          }
        },
      );
    });

    return completer.future
      ..whenComplete(() {
        subscription.cancel();
      });
  }

  Future<String?> _waitForConfirmationResult(String code, SignupData data) {
    final completer = Completer<String?>();

    profileBloc.add(
      ProfileEvent.confirmed(
        code: code,
        email: data.email,
        name: data.name,
      ),
    );

    final subscription = profileBloc.stream.listen((state) {
      state.mapOrNull(
        authenticated: (state) {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
        },
        error: (state) {
          if (!completer.isCompleted) {
            completer.complete('Error');
          }
        },
      );
    });

    return completer.future
      ..whenComplete(() {
        subscription.cancel();
      })
      ..then((value) {
        if (value == null) {
          router.pop();
        }
      });
  }
}
