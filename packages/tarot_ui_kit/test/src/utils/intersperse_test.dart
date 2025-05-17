import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  group('intersperse (flexible global)', () {
    test('should return an empty list when input is empty', () {
      expect(intersperse(2, <int>[]), isEmpty);
    });

    test('should return the same list when it contains a single element', () {
      expect(intersperse(2, [0]), equals([0]));
    });

    test('should insert element between list elements', () {
      expect(intersperse(2, [0, 0]), equals([0, 2, 0]));
      expect(intersperse('-', ['a', 'b', 'c']), equals(['a', '-', 'b', '-', 'c']));
    });

    test('should insert element between and wrap edges when insertFirst and insertLast are true', () {
      expect(intersperse(2, [0]), equals([0]));
      expect(intersperse(2, [0], insertFirst: true, insertLast: true), equals([2, 0, 2]));
      expect(intersperse(2, [0, 0], insertFirst: true, insertLast: true), equals([2, 0, 2, 0, 2]));
    });

    test('should skip first inserted element if insertFirst is false', () {
      expect(intersperse(2, [0], insertFirst: false, insertLast: true), equals([0, 2]));
    });

    test('should skip last inserted element if insertLast is false', () {
      expect(intersperse(2, [0], insertFirst: true, insertLast: false), equals([2, 0]));
    });

    test('should skip both edge elements if both flags are false', () {
      expect(intersperse(2, [0, 0], insertFirst: false, insertLast: false), equals([0, 2, 0]));
    });
  });
}
