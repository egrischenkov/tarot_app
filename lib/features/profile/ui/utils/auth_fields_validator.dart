import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';

class AuthFieldsValidator {
  final AppLocalizations _l10n;

  AuthFieldsValidator({required BuildContext context}) : _l10n = context.l10n;

  String? emailFieldValidator(String? value) {
    return FlutterLogin.defaultEmailValidator(
      value,
      _l10n.authScreen$Error$InvalidEmail,
    );
  }

  String? nameFieldValidator(String? value) {
    const minLength = 2;
    const maxLength = 50;

    if (value == null || value.length < minLength) {
      return _l10n.authScreen$Error$TooShort(minLength);
    }

    if (value.length > maxLength) {
      return _l10n.authScreen$Error$TooLong(maxLength);
    }

    return null;
  }

  String? passwordFieldValidator(String? value) {
    const minLength = 8;
    const maxLength = 32;

    final atLeastOneUpperCaseCharacter = RegExp(r'[A-Z]');
    final atLeastOneLowerCaseCharacter = RegExp(r'[a-z]');
    final atLeastOneNumber = RegExp(r'[0-9]');
    final atLeastOneSpecialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (value == null || value.length < minLength) {
      return _l10n.authScreen$Error$PasswordTooShort(minLength);
    }

    if (value.length > maxLength) {
      return _l10n.authScreen$Error$PasswordTooLong(maxLength);
    }

    if (!atLeastOneUpperCaseCharacter.hasMatch(value)) {
      return _l10n.authScreen$Error$AtLeastOneUpper;
    }

    if (!atLeastOneLowerCaseCharacter.hasMatch(value)) {
      return _l10n.authScreen$Error$AtLeastOneLower;
    }

    if (!atLeastOneNumber.hasMatch(value)) {
      return _l10n.authScreen$Error$AtLeastOneNumber;
    }

    if (!atLeastOneSpecialCharacter.hasMatch(value)) {
      return _l10n.authScreen$Error$AtLeastOneSpecCharacter;
    }

    return null;
  }
}
