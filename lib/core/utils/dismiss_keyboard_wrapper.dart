import 'package:flutter/material.dart';

/// We need this widget to hide keyboard by clicking outside of TextField.
class DismissKeyboardWrapper extends StatelessWidget {
  const DismissKeyboardWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
