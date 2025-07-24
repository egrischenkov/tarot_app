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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _moveToCenterAnimation;
  late final Animation<double> _shiftCardsAnimation;
  late final Animation<double> _expandAnimation;
  late final Animation<double> _returnBackAnimation;
  late final Animation<double> _resizeBackAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _initAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

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
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Positioned.fill(
                top: _appBarHeight,
                child: Stack(
                  children: [],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _initAnimations() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 650))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        }
      });

    _moveToCenterAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, .5, curve: Curves.easeIn),
      ),
    );

    _shiftCardsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.15, 0.7, curve: Curves.easeInOut),
      ),
    );

    _expandAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.55, 1, curve: Curves.easeIn),
      ),
    );

    _returnBackAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.25, 0.85, curve: Curves.easeIn),
      ),
    );

    _resizeBackAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.easeIn),
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
