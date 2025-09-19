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
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/ui/bloc/auth/auth_bloc.dart';
import 'package:taro/features/profile/ui/widgets/profile_widget.dart';
import 'package:taro/features/settings/ui/widgets/settings_section_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

part '../widgets/profile_header_widget.dart';
part '../widgets/profile_item.dart';
part '../widgets/profile_refresh_indicator.dart';
part '../widgets/screen_views/authenticated_profile_screen_view.dart';
part '../widgets/screen_views/unauthenticated_profile_screen_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.authStatus.isAuthenticated
            ? const AuthenticatedProfileScreenView()
            : const UnauthenticatedProfileScreenView();
      },
    );
  }
}
