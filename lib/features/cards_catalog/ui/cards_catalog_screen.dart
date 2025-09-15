import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class CardsCatalogScreen extends StatelessWidget {
  const CardsCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ColoredBox(
      color: colors.backgroundSecondary,
      child: const FlutterLogo(),
    );
  }
}
