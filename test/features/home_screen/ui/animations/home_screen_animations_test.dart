import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/home/ui/animations/home_screen_animations.dart';

class FakeTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

void main() {
  test('HomeScreenAnimations initializes all animations correctly', () {
    final animations = HomeScreenAnimations(vsync: FakeTickerProvider());

    expect(animations.controller, isA<AnimationController>());
    expect(animations.moveToCenter, isNotNull);
    expect(animations.shiftCards, isNotNull);
    expect(animations.expand, isNotNull);
    expect(animations.returnBack, isNotNull);
    expect(animations.resizeBack, isNotNull);
    expect(animations.rotation, isNotNull);
  });
}
