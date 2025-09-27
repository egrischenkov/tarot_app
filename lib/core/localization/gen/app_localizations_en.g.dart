// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String get common$Error => 'Something went wrong. Please try again later.';

  @override
  String onboarding$Title$First(Object appName) {
    return 'Welcome to the world of $appName';
  }

  @override
  String get onboarding$Subtitle$First => 'Uncover the cards to better understand yourself, hear the Universe’s guidance, and find answers to important questions.';

  @override
  String get onboarding$Title$Second => 'Start your morning with guidance';

  @override
  String get onboarding$Subtitle$Second => 'Draw your daily card — get inspiration, advice, or a warning.';

  @override
  String get onboarding$Title$Third => 'Your personal guide';

  @override
  String get onboarding$Subtitle$Third => 'Receive daily spreads, decision-making tips, and explore your intuition more deeply.';

  @override
  String get onboarding$Button$Label => 'Go!';

  @override
  String get homeScreen$Menu$DailyCard => 'Daily Card';

  @override
  String get homeScreen$Menu$CardsCatalog => 'Learn the Cards';

  @override
  String get homeScreen$Menu$YesNo => 'Yes or No';

  @override
  String get profileScreen$Title => 'Profile';

  @override
  String get profileScreen$Subscription => 'Subscription';

  @override
  String get profileScreen$ChooseSubscription => 'Choose a subscription';

  @override
  String get profileScreen$SuggestSubscription => 'No subscription? Let’s find one';

  @override
  String get profileScreen$LoginButton$Label => 'Login';

  @override
  String get profileScreen$AddInfo$Title => 'Complete your profile to unlock more features!';

  @override
  String get profileScreen$AddInfo$Subtitle => 'Add your date of birth, gender, marital status, and even job information — the app will select personalized daily cards, spreads, and forecasts tailored just for you.';

  @override
  String get profileScreen$AddInfo$Button$Label => 'Complete profile';

  @override
  String get profileScreen$JoinUs => 'Join us — and the cards will speak just for you';

  @override
  String get settingsScreen$Title => 'Settings';

  @override
  String get settingsScreen$EditProfile => 'Edit profile';

  @override
  String get settingsScreen$ManageSubscription => 'Manage subscription';

  @override
  String get settingsScreen$App => 'App';

  @override
  String get settingsScreen$ChangeLanguage => 'Change language';

  @override
  String get settingsScreen$ChangeTheme => 'Theme';

  @override
  String get settingsScreen$AboutApp => 'About app';

  @override
  String get settingsScreen$FeedbackForm => 'Feedback form';

  @override
  String get settingsScreen$LogOut => 'Log out';

  @override
  String get settingsScreen$Theme$Light => 'Always light';

  @override
  String get settingsScreen$Theme$Dark => 'Always dark';

  @override
  String get settingsScreen$Theme$System => 'Follow system';

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
  String get feedbackFormScreen$Title => 'Feedback form';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'Share your feedback';

  @override
  String get feedbackFormScreen$RateYourExperience => 'Your experience';

  @override
  String get feedbackFormScreen$TerribleRate => 'Terrible';

  @override
  String get feedbackFormScreen$BadRate => 'Bad';

  @override
  String get feedbackFormScreen$OkayRate => 'Okay';

  @override
  String get feedbackFormScreen$GoodRate => 'Good';

  @override
  String get feedbackFormScreen$AwesomeRate => 'Awesome!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'What did you like?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'Card interpretations';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'App atmosphere & design';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'Accuracy of spreads';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'Ease of use';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'Variety of spreads';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'Inspiration & personal growth';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'Other';

  @override
  String get feedbackFormScreen$Send => 'Send';

  @override
  String get feedbackFromScreen$YourComment => 'Your comment (optional)';

  @override
  String get feedbackFromScreen$CommentHint => 'Describe your experience using the app';

  @override
  String get aboutScreen$Title => 'About';

  @override
  String get aboutScreen$PrivacyPolicy => 'Privacy Policy';

  @override
  String get aboutScreen$TermsOfService => 'Terms of Service';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return 'Try $appName! Download here:\n$appLink';
  }

  @override
  String get share$Title => 'Share our app';

  @override
  String get authScreen$Hint$Email => 'Email';

  @override
  String get authScreen$Hint$Password => 'Password';

  @override
  String get authScreen$Hint$Name => 'Имя';

  @override
  String get authScreen$Hint$ConfirmPassword => 'Confirm Password';

  @override
  String get authScreen$Label$ForgotPassword => 'Forgot Password?';

  @override
  String get authScreen$Label$Login => 'Login';

  @override
  String get authScreen$Label$SignUp => 'Sign Up';

  @override
  String get authScreen$Label$Recover => 'Recover';

  @override
  String get authScreen$Label$Back => 'Back';

  @override
  String get authScreen$Title$ResetYourPassword => 'Reset your password here';

  @override
  String get authScreen$Subtitle$WeWillSendYouPass => 'We will send your plain-text password to this email account';

  @override
  String get authScreen$Error$InvalidEmail => 'Invalid email!';

  @override
  String get authScreen$Error$PasswordDoNotMatch => 'Password do not match!';

  @override
  String get authScreen$Success$Success => 'Success';

  @override
  String get authScreen$Success$AnEmailSent => 'An email has been sent';

  @override
  String get authScreen$Title => 'Welcome!';

  @override
  String authScreen$Error$PasswordTooLong(Object count) {
    return 'Password is too long — maximum $count characters';
  }

  @override
  String authScreen$Error$PasswordTooShort(Object count) {
    return 'Password is too short — minimum $count characters';
  }

  @override
  String get authScreen$Error$AtLeastOneUpper => 'Password must contain at least one uppercase letter';

  @override
  String get authScreen$Error$AtLeastOneLower => 'Password must contain at least one lowercase letter';

  @override
  String get authScreen$Error$AtLeastOneNumber => 'Password must contain at least one number';

  @override
  String get authScreen$Error$AtLeastOneSpecCharacter => 'Password must contain at least one special character';

  @override
  String get authScreen$Error$Title => 'Error';

  @override
  String authScreen$Error$TooShort(Object count) {
    return 'Text is too short — minimum $count characters';
  }

  @override
  String authScreen$Error$TooLong(Object count) {
    return 'Text is too long — maximum $count characters';
  }

  @override
  String get authScreen$Success$AccountCreated => 'Account created successfully';
}
