import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/utils/dismiss_keyboard_wrapper.dart';
import 'package:taro/features/feedback_form/domain/entities/feedback_category.dart';
import 'package:taro/features/feedback_form/domain/entities/rate_type.dart';
import 'package:taro/features/feedback_form/ui/widgets/feedback_topic_widget.dart';
import 'package:taro/features/feedback_form/ui/widgets/rate_picker_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class FeedbackFormScreen extends StatefulWidget {
  const FeedbackFormScreen({super.key});

  @override
  State<FeedbackFormScreen> createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final commentTextController = TextEditingController();

  RateType selectedRateType = RateType.awesome;
  List<FeedbackCategory> selectedFeedbackCategories = List.empty();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final l10n = context.l10n;
    final colors = context.colors;
    final fonts = context.fonts;

    return IgnorePointer(
      ignoring: isLoading,
      child: DismissKeyboardWrapper(
        child: UiKitBaseScreen(
          title: l10n.feedbackFormScreen$Title,
          onBack: router.pop,
          bodyWithAppBarOffset: true,
          backgroundColor: colors.backgroundSecondary,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiKitSpacing.x4.h,
                Text(
                  l10n.feedbackFormScreen$ShareYourFeedback,
                  style: fonts.headlineLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                UiKitSpacing.x4.h,
                UiKitBaseSectionWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.feedbackFormScreen$RateYourExperience,
                        style: fonts.bodyEmphasized,
                      ),
                      UiKitSpacing.x4.h,
                      RatePickerWidget(
                        initialRateType: selectedRateType,
                        onSelect: (type) => selectedRateType = type,
                      ),
                    ],
                  ),
                ),
                UiKitSpacing.x4.h,
                UiKitBaseSectionWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.feedbackFormScreen$WhatDidYouLike,
                        style: fonts.bodyEmphasized,
                      ),
                      UiKitSpacing.x4.h,
                      FeedbackTopicWidget(
                        onSelectFeedbackCategories: (categories) {
                          selectedFeedbackCategories = categories;
                        },
                      ),
                    ],
                  ),
                ),
                UiKitSpacing.x4.h,
                UiKitBaseSectionWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.feedbackFromScreen$YourComment,
                        style: fonts.bodyEmphasized,
                      ),
                      UiKitSpacing.x4.h,
                      UiKitTextField(
                        controller: commentTextController,
                        hintText: l10n.feedbackFromScreen$CommentHint,
                        maxLength: 500,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                UiKitSpacing.x4.h,
                UiKitBaseSectionWrapper(
                  child: UiKitBigButton.regular(
                    context: context,
                    label: l10n.feedbackFormScreen$Send,
                    isExpanded: true,
                    isLoading: isLoading,
                    onTap: _onSendButtonTap,
                  ),
                ),
                UiKitSpacing.x10.h,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSendButtonTap() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = true;
    });

    if (mounted) {
      context.router.pop();
    }
  }
}
