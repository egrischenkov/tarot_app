extension CollectionExtension<T> on Iterable<T> {
  /// The current elements of this iterable modified by [toElement].
  ///
  /// Returns a new lazy [Iterable] with elements that are created by
  /// calling `toElement` on each element of this `Iterable` in
  /// iteration order.
  Iterable<K> mapWithIndex<K>(
    K Function(
      int index,
      T item,
      // ignore: avoid_positional_boolean_parameters
      bool isFirst,
      bool isLast,
    ) toElement,
  ) sync* {
    for (var i = 0; i < length; i++) {
      yield toElement(
        i,
        elementAt(i),
        i == 0,
        i == length - 1,
      );
    }
  }
}
