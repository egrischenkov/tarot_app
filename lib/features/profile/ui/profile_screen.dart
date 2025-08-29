import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: UiKitAppBar(
        title: l10n.profileScreen$Title,
        actions: const [
          Icon(Icons.upload_rounded),
          Icon(Icons.settings),
        ],
        onBack: () => context.router.pop(),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colors.lightYellow, colors.accentYellowSec],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
