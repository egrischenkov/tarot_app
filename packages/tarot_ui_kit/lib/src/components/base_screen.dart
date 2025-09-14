import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final double? scrollOffset;
  final bool bodyWithAppBarOffset;
  final Color? backgroundColor;

  const UiKitBaseScreen({
    required this.title,
    required this.body,
    this.actions,
    this.onBack,
    this.scrollOffset,
    this.bodyWithAppBarOffset = false,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appBarOffset = MediaQuery.of(context).padding.top + UiKitAppBar.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor ?? context.colors.backgroundSecondary,
      appBar: UiKitAppBar(
        title: title,
        actions: actions,
        onBack: onBack,
        scrollOffset: scrollOffset,
      ),
      body: bodyWithAppBarOffset
          ? SingleChildScrollView(
              child: Column(
                children: [
                  appBarOffset.h,
                  body,
                ],
              ),
            )
          : body,
    );
  }
}
