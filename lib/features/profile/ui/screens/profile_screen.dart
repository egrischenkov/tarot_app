import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';
import 'package:taro/features/profile/ui/widgets/profile_widget.dart';
import 'package:taro/features/settings/ui/widgets/settings_section_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

part '../widgets/profile_header_widget.dart';
part '../widgets/profile_item.dart';
part '../widgets/profile_refresh_indicator.dart';
part '../widgets/screen_views/authenticated_profile_screen_view.dart';
part '../widgets/screen_views/unauthenticated_profile_screen_view.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.isAuthenticated
            ? const AuthenticatedProfileScreenView()
            : const UnauthenticatedProfileScreenView();
      },
    );
  }
}
