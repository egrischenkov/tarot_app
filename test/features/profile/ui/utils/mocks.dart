import 'package:mocktail/mocktail.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';

class L10nMock extends Mock implements AppLocalizations {
  @override
  String get authScreen$Error$InvalidEmail => 'Invalid email';

  @override
  String authScreen$Error$TooShort(Object min) => 'Too short, min $min chars';

  @override
  String authScreen$Error$TooLong(Object max) => 'Too long, max $max chars';

  @override
  String authScreen$Error$PasswordTooShort(Object min) => 'Password too short, min $min chars';

  @override
  String authScreen$Error$PasswordTooLong(Object max) => 'Password too long, max $max chars';

  @override
  String get authScreen$Error$AtLeastOneUpper => 'Need at least one uppercase';

  @override
  String get authScreen$Error$AtLeastOneLower => 'Need at least one lowercase';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'Need at least one number';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'Need at least one special char';
}
