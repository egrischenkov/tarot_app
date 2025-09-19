part of '../screens/profile_screen.dart';

class ProfileItem extends StatelessWidget {
  final Widget child;

  const ProfileItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return UiKitBaseSectionWrapper(
      child: child,
    );
  }
}
