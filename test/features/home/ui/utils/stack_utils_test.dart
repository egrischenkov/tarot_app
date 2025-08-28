import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/home/domain/entities/menu_card_model.dart';
import 'package:taro/features/home/ui/utils/reorder_utils.dart';

void main() {
  test('reorderStack reorders selected card and reinserts previous correctly', () {
    final cards = [
      MenuCardModel(id: 'daily_card'),
      MenuCardModel(id: 'spreads'),
      MenuCardModel(id: 'funny'),
    ];
    final previous = MenuCardModel(id: 'funny');
    final deckOrder = ['daily_card', 'spreads', 'funny'];

    reorderStack(
      cards: cards,
      selectedIndex: 1, // selects 'spreads'
      previousCard: previous,
      deckOrder: deckOrder,
    );

    expect(cards.first.id, 'spreads'); // new card goes to top
    expect(cards.last.id, 'funny'); // previous goes to correct position
  });
}
