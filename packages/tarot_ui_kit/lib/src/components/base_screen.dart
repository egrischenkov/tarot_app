import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final double? scrollOffset;
  final bool bodyWithAppBarOffset;

  const BaseScreen({
    required this.title,
    required this.body,
    this.actions,
    this.onBack,
    this.scrollOffset,
    this.bodyWithAppBarOffset = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const appBarOffset = UiKitAppBar.height + UiKitSpacing.x6;

    return Scaffold(
      extendBodyBehindAppBar: true,
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
