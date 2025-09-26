import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/profile/ui/utils/auth_fields_validator.dart';

import 'mocks.dart';

void main() {
  late AuthFieldsValidator validator;

  setUp(() {
    validator = AuthFieldsValidator(l10n: L10nMock());
  });

  group('emailFieldValidator', () {
    test('returns error for invalid email', () {
      expect(validator.emailFieldValidator('not_email'), 'Invalid email');
    });

    test('returns null for valid email', () {
      expect(validator.emailFieldValidator('test@example.com'), null);
    });
  });

  group('nameFieldValidator', () {
    test('returns error if name is too short', () {
      expect(validator.nameFieldValidator('A'), 'Too short, min 2 chars');
    });

    test('returns error if name is too long', () {
      expect(validator.nameFieldValidator('A' * 51), 'Too long, max 50 chars');
    });

    test('returns null for valid name', () {
      expect(validator.nameFieldValidator('Alexander'), null);
    });
  });

  group('passwordFieldValidator', () {
    test('returns error if password is too short', () {
      expect(validator.passwordFieldValidator('Ab1!'), 'Password too short, min 8 chars');
    });

    test('returns error if password is too long', () {
      expect(validator.passwordFieldValidator('A' * 33), 'Password too long, max 32 chars');
    });

    test('returns error if missing uppercase letter', () {
      expect(validator.passwordFieldValidator('password1!'), 'Need at least one uppercase');
    });

    test('returns error if missing lowercase letter', () {
      expect(validator.passwordFieldValidator('PASSWORD1!'), 'Need at least one lowercase');
    });

    test('returns error if missing number', () {
      expect(validator.passwordFieldValidator('Password!'), 'Need at least one number');
    });

    test('returns error if missing special character', () {
      expect(validator.passwordFieldValidator('Password1'), 'Need at least one special char');
    });

    test('returns null for valid password', () {
      expect(validator.passwordFieldValidator('Password1!'), null);
    });
  });
}
