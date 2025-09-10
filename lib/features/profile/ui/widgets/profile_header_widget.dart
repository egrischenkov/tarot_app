part of '../profile_screen.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final Widget? content;

  const ProfileHeaderWidget({
    required this.name,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;
    final colors = context.colors;

    const cutoutRadius = 50.0;
    const paddingAroundAvatar = UiKitSpacing.x2;

    const avaRadius = cutoutRadius - paddingAroundAvatar;
    const avaSize = avaRadius * 2;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Widget for making bottom part of container with another background which corresponds
        // to profile screen background.
        // It is needed to achieve transparent background for avatar widget.
        Positioned(
          bottom: 0,
          height: UiKitSpacing.x5,
          width: MediaQuery.of(context).size.width,
          child: ColoredBox(
            color: colors.backgroundSecondary,
          ),
        ),
        ClipContainerWithCutout(
          cutoutRadius: cutoutRadius,
          color: colors.background,
          child: Column(
            children: [Text(name, style: fonts.bodyEmphasized)],
          ),
        ),
        Positioned(
          top: -avaRadius,
          left: MediaQuery.of(context).size.width / 2 - avaRadius,
          child: Hero(
            tag: ProfileWidget.heroTag,
            child: ProfileWidget(
              size: avaSize,
              child: Assets.icons.ava1.svg(
                height: avaSize,
                width: avaSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClipContainerWithCutout extends StatelessWidget {
  final Widget child;
  final double cutoutRadius;
  final Color color;

  const ClipContainerWithCutout({
    required this.child,
    required this.cutoutRadius,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ContainerCutoutClipper(cutoutRadius: cutoutRadius),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: cutoutRadius + UiKitSpacing.x2,
          left: UiKitSpacing.x4,
          right: UiKitSpacing.x4,
          bottom: UiKitSpacing.x4,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(UiKitRadius.x4),
        ),
        child: child,
      ),
    );
  }
}

class _ContainerCutoutClipper extends CustomClipper<Path> {
  final double cutoutRadius;

  _ContainerCutoutClipper({required this.cutoutRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo((size.width / 2) - cutoutRadius, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(size.width / 2, 0),
          radius: cutoutRadius,
        ),
        pi,
        -pi,
        false,
      )
      ..lineTo(size.width / 2 + cutoutRadius, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
