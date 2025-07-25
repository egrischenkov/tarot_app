import 'package:taro/features/home/domain/entities/menu_card_model.dart';

void reorderStack({
  required List<MenuCardModel> cards,
  required int selectedIndex,
  required MenuCardModel? previousCard,
  required List<String> deckOrder,
}) {
  final selected = cards.removeAt(selectedIndex);
  cards.insert(0, selected);

  if (previousCard != null) {
    final index = cards.indexWhere((c) => c.id == previousCard.id);
    if (index != -1) {
      final toReinsert = cards.removeAt(index);
      final targetDeckIndex = deckOrder.indexOf(toReinsert.id);

      int insertAt = cards.length;
      for (final card in cards.skip(1)) {
        final deckIndex = deckOrder.indexOf(card.id);
        if (targetDeckIndex < deckIndex) {
          insertAt = cards.indexOf(card);
          break;
        }
      }

      cards.insert(insertAt, toReinsert);
    }
  }
}
