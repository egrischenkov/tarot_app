import 'package:taro/core/app_runner/app_runner.dart';
import 'package:taro/core/app_runner/configs/flavor_config.dart';

void main() {
  final appRunner = AppRunner(
    flavorConfig: FlavorConfig.dev(),
  );

  appRunner.startup();
}
