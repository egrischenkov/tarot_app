/// Inserts [element] between every element in [iterable].
///
/// If [insertFirst] is `true`, inserts [element] before the first item.
/// If [insertLast] is `true`, inserts [element] after the last item.
/// Inserts [element] between every element in [iterable].
///
/// If [insertFirst] is `true`, inserts [element] before the first item.
/// If [insertLast] is `true`, inserts [element] after the last item.
///
/// Example:
///     final list1 = intersperse(2, <int>[]); // [];
///     final list2 = intersperse(2, [0]); // [0];
///     final list3 = intersperse(2, [0, 0]); // [0, 2, 0];
///     final list4 = intersperse(2, [0, 0], insertFirst: true, insertLast: true); // [2, 0, 2, 0, 2];
///     final list5 = intersperse(2, [0, 0], insertFirst: false, insertLast: true); // [0, 2, 0, 2];
Iterable<T> intersperse<T>(
  T element,
  Iterable<T> iterable, {
  bool insertFirst = false,
  bool insertLast = false,
}) sync* {
  final iterator = iterable.iterator;

  final hasItems = iterator.moveNext();
  if (!hasItems) {
    return;
  }

  if (insertFirst) {
    yield element;
  }

  yield iterator.current;
  while (iterator.moveNext()) {
    yield element;
    yield iterator.current;
  }

  if (insertLast) {
    yield element;
  }
}
