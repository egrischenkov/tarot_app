part of '../profile_screen.dart';

class ProfileItem extends StatelessWidget {
  final Widget child;

  const ProfileItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(UiKitSpacing.x4),
      decoration: BoxDecoration(
        color: colors.whiteBgWhite,
        borderRadius: BorderRadius.circular(UiKitSpacing.x4),
      ),
      child: child,
    );
  }
}
