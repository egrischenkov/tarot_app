import 'package:flutter_test/flutter_test.dart';

// Функция из твоего кода
bool isGenericTypeNullable<T>() => null is T;

void main() {
  group('isGenericTypeNullable', () {
    test('returns false for non-nullable int', () {
      expect(isGenericTypeNullable<int>(), false);
    });

    test('returns true for nullable int?', () {
      expect(isGenericTypeNullable<int?>(), true);
    });

    test('returns false for non-nullable String', () {
      expect(isGenericTypeNullable<String>(), false);
    });

    test('returns true for nullable String?', () {
      expect(isGenericTypeNullable<String?>(), true);
    });

    test('returns false for non-nullable Object', () {
      expect(isGenericTypeNullable<Object>(), false);
    });

    test('returns true for nullable Object?', () {
      expect(isGenericTypeNullable<Object?>(), true);
    });

    test('returns true for dynamic type', () {
      // dynamic всегда может быть null
      expect(isGenericTypeNullable<dynamic>(), true);
    });

    test('returns true for nullable generic type', () {
      expect(isGenericTypeNullable<Null>(), true);
    });
  });
}
