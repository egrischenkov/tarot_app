import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/feedback_form/domain/entities/rate_type.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class RatePickerWidget extends StatefulWidget {
  final ValueSetter<RateType> onSelect;
  final RateType initialRateType;

  const RatePickerWidget({
    required this.onSelect,
    required this.initialRateType,
    super.key,
  });

  @override
  State<RatePickerWidget> createState() => _RatePickerWidgetState();
}

class _RatePickerWidgetState extends State<RatePickerWidget> {
  late RateType selectedRateType;

  @override
  void initState() {
    super.initState();

    selectedRateType = widget.initialRateType;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: intersperse(
        UiKitSpacing.x2.w,
        RateType.values.map((rate) {
          return GestureDetector(
            onTap: () => _onEmojiItemTap(rate),
            child: _EmojiItem(
              rate: rate,
              isSelected: rate == selectedRateType,
            ),
          );
        }).toList(),
      ).toList(),
    );
  }

  void _onEmojiItemTap(RateType rate) {
    widget.onSelect(rate);
    setState(() {
      selectedRateType = rate;
    });
  }
}

class _EmojiItem extends StatelessWidget {
  final RateType rate;
  final bool isSelected;

  const _EmojiItem({
    required this.rate,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Column(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(UiKitSpacing.x3),
              decoration: BoxDecoration(
                color: isSelected ? colors.accent : colors.backgroundSecondary,
                shape: BoxShape.circle,
              ),
              child: Text(
                rate.emoji,
                style: const TextStyle(fontSize: UiKitSize.x8),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.accentSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: colors.background,
                    size: UiKitSize.x6,
                  ),
                ),
              ),
          ],
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Column(
            children: [
              UiKitSpacing.base.h,
              Text(
                rate.getLabel(context),
                style: fonts.xsLabel,
              ),
            ],
          ),
          secondChild: const SizedBox(
            height: UiKitSize.x6,
          ),
        ),
      ],
    );
  }
}

extension _RateTypeX on RateType {
  String get emoji => switch (this) {
        RateType.terrible => '😡',
        RateType.bad => '🙁',
        RateType.okay => '😐',
        RateType.good => '🙂',
        RateType.awesome => '😍'
      };

  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      RateType.terrible => l10n.feedbackFormScreen$TerribleRate,
      RateType.bad => l10n.feedbackFormScreen$BadRate,
      RateType.okay => l10n.feedbackFormScreen$OkayRate,
      RateType.good => l10n.feedbackFormScreen$GoodRate,
      RateType.awesome => l10n.feedbackFormScreen$AwesomeRate,
    };
  }
}
