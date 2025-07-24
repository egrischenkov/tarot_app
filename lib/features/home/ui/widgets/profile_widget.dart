import 'package:flutter/widgets.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.icons.ava1.svg(
      height: 64,
      width: 64,
    );
  }
}
