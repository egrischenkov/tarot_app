import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 80;

  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  const UiKitAppBar({
    required this.title,
    this.onBack,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    const borderRadius = BorderRadius.vertical(
      bottom: Radius.circular(UiKitRadius.x5),
    );

    return Material(
      elevation: UiKitSpacing.base,
      borderRadius: borderRadius,
      shadowColor: colors.whiteBgSecondary.withValues(alpha: 0.6),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.whiteBgWhite,
            borderRadius: borderRadius,
          ),
          child: SafeArea(
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
                          UiKitSpacing.x6.w,
                          Text(
                            title,
                            style: context.fonts.headlineLarge.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          UiKitSpacing.x4.w,
                        ],
                      ),
                    ),
                    ...intersperse(UiKitSpacing.x5.w, actions ?? []),
                  ],
                ),
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
