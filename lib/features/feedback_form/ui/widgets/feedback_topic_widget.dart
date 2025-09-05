import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/feedback_form/domain/entities/feedback_category.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class FeedbackTopicWidget extends StatefulWidget {
  final ValueSetter<List<FeedbackCategory>> onSelectFeedbackCategories;

  const FeedbackTopicWidget({
    required this.onSelectFeedbackCategories,
    super.key,
  });

  @override
  State<FeedbackTopicWidget> createState() => _FeedbackTopicWidgetState();
}

class _FeedbackTopicWidgetState extends State<FeedbackTopicWidget> {
  List<FeedbackCategory> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: FeedbackCategory.values.map((category) {
        return UiKitCheckboxLineItem(
          title: category.getLabel(context),
          onChanged: (value) => _onCategorySelect(category, value),
          isSelected: selectedCategories.contains(category),
        );
      }).toList(),
    );
  }

  void _onCategorySelect(FeedbackCategory category, bool? value) {
    setState(() {
      value == true ? selectedCategories.add(category) : selectedCategories.remove(category);
    });
    widget.onSelectFeedbackCategories(selectedCategories);
  }
}

extension _FeedbackCategoryX on FeedbackCategory {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      FeedbackCategory.cardInterpretations => l10n.feedbackFormScreen$FeedbackCategory$CardInterpretations,
      FeedbackCategory.appDesign => l10n.feedbackFormScreen$FeedbackCategory$AppDesign,
      FeedbackCategory.accuracy => l10n.feedbackFormScreen$FeedbackCategory$Accuracy,
      FeedbackCategory.usability => l10n.feedbackFormScreen$FeedbackCategory$Usability,
      FeedbackCategory.variety => l10n.feedbackFormScreen$FeedbackCategory$Variety,
      FeedbackCategory.inspiration => l10n.feedbackFormScreen$FeedbackCategory$Inspiration,
      FeedbackCategory.other => l10n.feedbackFormScreen$FeedbackCategory$Other,
    };
  }
}
