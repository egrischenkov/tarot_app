import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/home/domain/entities/menu_card_model.dart';
import 'package:taro/features/home/ui/widgets/profile_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

const _appBarHeight = 120.0;

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: _appBarHeight,
              color: colors.whiteBgWhite,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ProfileWidget()],
              ),
            ),
          ),
          const Placeholder(),
        ],
      ),
    );
  }
}

extension on MenuCardModel {
  IconData get icon {
    return switch (id) {
      'daily_card' => Icons.calendar_month,
      'funny' => Icons.celebration,
      'yammy' => Icons.food_bank,
      'spreads' => Icons.card_giftcard,
      _ => Icons.face,
    };
  }

  String getName(BuildContext context) {
    final l10n = context.l10n;

    return switch (id) {
      'daily_card' => l10n.homeScreen$MenuDailyCard,
      'funny' => l10n.homeScreen$MenuFunny,
      'yammy' => l10n.homeScreen$MenuYammy,
      'spreads' => l10n.homeScreen$MenuSpreads,
      _ => '',
    };
  }
}
