import 'package:flutter/cupertino.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBigButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final Color pressedColor;
  final bool isLoading;
  final bool isExpanded;
  final String? title;
  final Widget? suffix;
  final VoidCallback? onTap;

  factory UiKitBigButton.regular({
    required BuildContext context,
    required String label,
    String? title,
    Widget? suffix,
    bool isLoading = false,
    bool isExpanded = false,
    VoidCallback? onTap,
  }) =>
      UiKitBigButton._(
        label: label,
        backgroundColor: context.colors.accentYellow,
        labelColor: context.colors.itsyBitsyBlack,
        pressedColor: context.colors.accentYellowSec.withBrightness(1.5),
        title: title,
        suffix: suffix,
        isLoading: isLoading,
        isExpanded: isExpanded,
        onTap: onTap,
      );

  factory UiKitBigButton.secondary({
    required BuildContext context,
    required String label,
    String? title,
    Widget? suffix,
    bool isLoading = false,
    bool isExpanded = false,
    VoidCallback? onTap,
  }) =>
      UiKitBigButton._(
        label: label,
        backgroundColor: context.colors.grey,
        labelColor: context.colors.itsyBitsyBlack,
        pressedColor: context.colors.grey.withBrightness(0.8),
        title: title,
        suffix: suffix,
        isLoading: isLoading,
        isExpanded: isExpanded,
        onTap: onTap,
      );

  const UiKitBigButton._({
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    required this.pressedColor,
    this.isLoading = false,
    this.isExpanded = false,
    this.title,
    this.suffix,
    this.onTap,
  });

  @override
  State<UiKitBigButton> createState() => _UiKitBigButtonState();
}

class _UiKitBigButtonState extends State<UiKitBigButton> {
  bool _isPressed = false;

  Color get _backgroundColor => _isPressed && widget.onTap != null ? widget.pressedColor : widget.backgroundColor;

  bool get _isDisabled => widget.onTap == null;

  bool get _canTap => !widget.isLoading && _isDisabled;

  EdgeInsets get _padding => widget.title == null
      ? const EdgeInsets.all(UiKitSpacing.x2)
      : const EdgeInsets.symmetric(
          horizontal: UiKitSpacing.x4,
          vertical: UiKitSpacing.x2,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        _isPressed = false;
      }),
      onTapCancel: () => setState(() {
        _isPressed = false;
      }),
      onTap: _canTap == false ? widget.onTap : null,
      child: Opacity(
        opacity: _isDisabled ? .2 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiKitRadius.x4),
            color: _backgroundColor,
          ),
          child: Padding(
            padding: _padding,
            child: widget.isLoading
                ? Center(
                    child: CupertinoActivityIndicator(
                      color: widget.labelColor,
                    ),
                  )
                : Row(
                    mainAxisSize: widget.isExpanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment:
                        widget.suffix != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.title != null)
                            Text(
                              widget.title!,
                              style: context.fonts.xsLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          Text(
                            widget.label,
                            style: context.fonts.bodyEmphasized.copyWith(
                              color: widget.labelColor,
                              fontSize: 15,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      if (widget.suffix != null) ...[
                        const SizedBox(width: UiKitSpacing.x3),
                        widget.suffix!,
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color withBrightness(double brightnessPercent) {
    final HSLColor hslColor = HSLColor.fromColor(this);

    return hslColor.withLightness(hslColor.lightness * brightnessPercent).toColor();
  }
}
