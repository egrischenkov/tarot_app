// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String onboarding$Title$First(Object appName) {
    return 'स्वागत है $appName की दुनिया में';
  }

  @override
  String get onboarding$Subtitle$First => 'कार्ड्स खोलें ताकि आप खुद को बेहतर समझ सकें, ब्रह्मांड की संकेत सुन सकें और महत्वपूर्ण सवालों के जवाब पा सकें।';

  @override
  String get onboarding$Title$Second => 'सुबह की शुरुआत करें एक संकेत से';

  @override
  String get onboarding$Subtitle$Second => 'दिन का कार्ड निकालें — प्रेरणा, सलाह या चेतावनी पाएं।';

  @override
  String get onboarding$Title$Third => 'आपका निजी मार्गदर्शक';

  @override
  String get onboarding$Subtitle$Third => 'दैनिक रीडिंग्स पाएं, निर्णय लेने के सुझाव और अपनी अंतर्ज्ञान को और गहराई से खोजें।';

  @override
  String get onboarding$Button$Label => 'चलो!';

  @override
  String get homeScreen$Menu$DailyCard => 'आज का कार्ड';

  @override
  String get homeScreen$Menu$CardsCatalog => 'कार्ड्स जानें';

  @override
  String get homeScreen$Menu$YesNo => 'हाँ या नहीं';

  @override
  String get profileScreen$Title => 'प्रोफ़ाइल';

  @override
  String get profileScreen$Subscription => 'सदस्यता';

  @override
  String get profileScreen$ChooseSubscription => 'सदस्यता चुनें';

  @override
  String get profileScreen$SuggestSubscription => 'कोई सदस्यता नहीं? चलो एक ढूँढते हैं';

  @override
  String get profileScreen$LoginButton$Label => 'लॉगिन';

  @override
  String get settingsScreen$Title => 'सेटिंग्स';

  @override
  String get settingsScreen$EditProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get settingsScreen$ManageSubscription => 'सदस्यता प्रबंधित करें';

  @override
  String get settingsScreen$App => 'ऐप';

  @override
  String get settingsScreen$ChangeLanguage => 'भाषा बदलें';

  @override
  String get settingsScreen$ChangeTheme => 'थीम';

  @override
  String get settingsScreen$AboutApp => 'ऐप के बारे में';

  @override
  String get settingsScreen$FeedbackForm => 'फ़ीडबैक फ़ॉर्म';

  @override
  String get settingsScreen$LogOut => 'लॉग आउट करें';

  @override
  String get settingsScreen$Theme$Light => 'हमेशा हल्का';

  @override
  String get settingsScreen$Theme$Dark => 'हमेशा गहरा';

  @override
  String get settingsScreen$Theme$System => 'सिस्टम के अनुसार';

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
  String get feedbackFormScreen$Title => 'फ़ीडबैक फ़ॉर्म';

  @override
  String get feedbackFormScreen$ShareYourFeedback => 'अपना फ़ीडबैक साझा करें';

  @override
  String get feedbackFormScreen$RateYourExperience => 'आपका अनुभव';

  @override
  String get feedbackFormScreen$TerribleRate => 'भयानक';

  @override
  String get feedbackFormScreen$BadRate => 'खराब';

  @override
  String get feedbackFormScreen$OkayRate => 'ठीक-ठाक';

  @override
  String get feedbackFormScreen$GoodRate => 'अच्छा';

  @override
  String get feedbackFormScreen$AwesomeRate => 'शानदार!';

  @override
  String get feedbackFormScreen$WhatDidYouLike => 'आपको क्या पसंद आया?';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => 'कार्ड की व्याख्या';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => 'ऐप का वातावरण और डिज़ाइन';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => 'स्प्रेड्स की सटीकता';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => 'उपयोग में आसानी';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => 'स्प्रेड्स की विविधता';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => 'प्रेरणा और व्यक्तिगत विकास';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => 'अन्य';

  @override
  String get feedbackFormScreen$Send => 'भेजें';

  @override
  String get feedbackFromScreen$YourComment => 'आपकी टिप्पणी (वैकल्पिक)';

  @override
  String get feedbackFromScreen$CommentHint => 'ऐप उपयोग करने का अपना अनुभव लिखें';

  @override
  String get aboutScreen$Title => 'ऐप के बारे में';

  @override
  String get aboutScreen$PrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get aboutScreen$TermsOfService => 'सेवा की शर्तें';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return '$appName आज़माएं! यहाँ डाउनलोड करें:\n$appLink';
  }

  @override
  String get share$Title => 'हमारे ऐप को साझा करें';
}
