import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/profile/data/repositories_implementations/profile_repository_impl.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';
import 'package:taro/features/profile/ui/bloc/auth/auth_bloc.dart';
import 'package:taro/features/profile/ui/profile_screen.dart';

@RoutePage()
class ProfileEntry extends StatelessWidget implements AutoRouteWrapper {
  const ProfileEntry({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final profileRepository = ProfileRepositoryImpl(
      appConfigurationsStorage: context.appDependenciesContainer.appConfigurationsStorage,
    );
    final authBloc = AuthBloc(
      setAuthStatusUseCase: SetCurrentUserAuthenticationStatusUseCase(
        profileRepository: profileRepository,
      ),
      getAuthStatusUseCase: GetCurrentUserAuthenticationStatus(
        profileRepository: profileRepository,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}
