import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class YesNoScreen extends StatelessWidget {
  const YesNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ColoredBox(
      color: colors.backgroundSecondary,
      child: const FlutterLogo(),
    );
  }
}
