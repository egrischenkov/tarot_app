import 'package:flutter/widgets.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';

class ProfileWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileWidget({
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Assets.icons.ava1.svg(
        height: 64,
        width: 64,
      ),
    );
  }
}
