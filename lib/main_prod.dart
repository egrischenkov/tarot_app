import 'package:taro/core/app_runner/app_runner.dart';
import 'package:taro/core/app_runner/flavor_config.dart';

void main() {
  final appRunner = AppRunner(
    flavorConfig: FlavorConfig.prod(),
  );

  appRunner.startup();
}
