import 'package:flutter/widgets.dart';

extension SizedBoxExtensions on num {
  /// Возвращает SizedBox с заданной высотой
  SizedBox get h => SizedBox(height: toDouble());

  /// Возвращает SizedBox с заданной шириной
  SizedBox get w => SizedBox(width: toDouble());
}
