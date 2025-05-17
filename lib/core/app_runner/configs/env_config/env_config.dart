import 'package:taro/core/app_runner/configs/env_config/environment.dart';

final class EnvConfig {
  const EnvConfig();

  Environment get environment => Environment.fromString(const String.fromEnvironment('ENVIRONMENT'));
}
