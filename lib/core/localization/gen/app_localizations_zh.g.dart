// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Stary';

  @override
  String get companyName => 'Tarot Band';

  @override
  String onboarding$Title$First(Object appName) {
    return '欢迎来到 $appName 的世界';
  }

  @override
  String get onboarding$Subtitle$First => '翻开卡牌，更好地了解自己，聆听宇宙的指引，找到重要问题的答案。';

  @override
  String get onboarding$Title$Second => '用提示开始你的早晨';

  @override
  String get onboarding$Subtitle$Second => '抽取今日卡牌 —— 获得启发、建议或警示。';

  @override
  String get onboarding$Title$Third => '你的私人向导';

  @override
  String get onboarding$Subtitle$Third => '获取每日牌阵、决策建议，更深入探索你的直觉。';

  @override
  String get onboarding$Button$Label => '开始!';

  @override
  String get homeScreen$Menu$DailyCard => '今日卡牌';

  @override
  String get homeScreen$Menu$CardsCatalog => '认识卡牌';

  @override
  String get homeScreen$Menu$YesNo => '是或否';

  @override
  String get profileScreen$Title => '个人资料';

  @override
  String get profileScreen$Subscription => '订阅';

  @override
  String get profileScreen$ChooseSubscription => '选择订阅';

  @override
  String get profileScreen$SuggestSubscription => '没有订阅？我们来帮你选一个';

  @override
  String get settingsScreen$Title => '设置';

  @override
  String get settingsScreen$EditProfile => '编辑资料';

  @override
  String get settingsScreen$ManageSubscription => '管理订阅';

  @override
  String get settingsScreen$App => '应用';

  @override
  String get settingsScreen$ChangeLanguage => '更改语言';

  @override
  String get settingsScreen$ChangeTheme => '主题';

  @override
  String get settingsScreen$AboutApp => '关于应用';

  @override
  String get settingsScreen$FeedbackForm => '反馈表';

  @override
  String get settingsScreen$LogOut => '退出账号';

  @override
  String get settingsScreen$Theme$Light => '始终浅色';

  @override
  String get settingsScreen$Theme$Dark => '始终深色';

  @override
  String get settingsScreen$Theme$System => '跟随系统';

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
  String get feedbackFormScreen$Title => '反馈表';

  @override
  String get feedbackFormScreen$ShareYourFeedback => '分享你的反馈';

  @override
  String get feedbackFormScreen$RateYourExperience => '你的体验';

  @override
  String get feedbackFormScreen$TerribleRate => '糟糕';

  @override
  String get feedbackFormScreen$BadRate => '差';

  @override
  String get feedbackFormScreen$OkayRate => '一般';

  @override
  String get feedbackFormScreen$GoodRate => '好';

  @override
  String get feedbackFormScreen$AwesomeRate => '太棒了！';

  @override
  String get feedbackFormScreen$WhatDidYouLike => '你喜欢什么？';

  @override
  String get feedbackFormScreen$FeedbackCategory$CardInterpretations => '卡牌解读';

  @override
  String get feedbackFormScreen$FeedbackCategory$AppDesign => '应用氛围与设计';

  @override
  String get feedbackFormScreen$FeedbackCategory$Accuracy => '牌阵的准确性';

  @override
  String get feedbackFormScreen$FeedbackCategory$Usability => '使用便捷性';

  @override
  String get feedbackFormScreen$FeedbackCategory$Variety => '牌阵的多样性';

  @override
  String get feedbackFormScreen$FeedbackCategory$Inspiration => '启发与个人成长';

  @override
  String get feedbackFormScreen$FeedbackCategory$Other => '其他';

  @override
  String get feedbackFormScreen$Send => '发送';

  @override
  String get feedbackFromScreen$YourComment => '你的评论（可选）';

  @override
  String get feedbackFromScreen$CommentHint => '描述你使用应用的体验';

  @override
  String get aboutScreen$Title => '关于';

  @override
  String get aboutScreen$PrivacyPolicy => '隐私政策';

  @override
  String get aboutScreen$TermsOfService => '服务条款';

  @override
  String share$Suggest(Object appLink, Object appName) {
    return '试试 $appName！在这里下载:\n$appLink';
  }

  @override
  String get share$Title => '分享我们的应用';
}
