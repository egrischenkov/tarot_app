import 'package:flutter/widgets.dart';

class ProfileWidget extends StatelessWidget {
  static const String heroTag = 'profile_ava';

  final VoidCallback? onTap;
  final Widget child;
  final double size;

  const ProfileWidget({
    required this.child,
    this.size = 64,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
