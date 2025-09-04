import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 80;

  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final double? scrollOffset;

  const UiKitAppBar({
    required this.title,
    this.onBack,
    this.actions,
    this.scrollOffset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    const borderRadius = BorderRadius.vertical(
      bottom: Radius.circular(UiKitRadius.x5),
    );

    final localScrollOffset = scrollOffset;
    final opacity = localScrollOffset != null ? (localScrollOffset / 100).clamp(0, 1).toDouble() : 1.0;

    final bgColor = colors.whiteBgWhite.withValues(alpha: opacity);
    final elevation = opacity > 0.9 ? 2.0 : 0.0;

    return Material(
      elevation: elevation,
      color: bgColor,
      borderRadius: borderRadius,
      shadowColor: colors.whiteBgSecondary.withValues(alpha: 0.6),
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        flexibleSpace: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: bgColor,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UiKitSpacing.x4,
                vertical: UiKitSpacing.x3,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        UiKitBackButton(onTap: onBack),
                        if (actions != null) UiKitSpacing.x6.w,
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: context.fonts.headlineLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        UiKitSpacing.x4.w,
                      ],
                    ),
                  ),
                  if (actions != null) ...[
                    ...intersperse(UiKitSpacing.x8.w, actions ?? []),
                    UiKitSpacing.x2.w,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
