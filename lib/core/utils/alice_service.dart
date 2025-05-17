import 'package:flutter_alice/alice.dart';
import 'package:flutter_alice/core/alice_dio_interceptor.dart';
import 'package:taro/core/routing/app_router.dart';

final class AliceService {
  Alice? _alice;

  void init() {
    _alice = Alice(
      navigatorKey: AppRouter.rootRouterGlobalKey,
    );
  }

  void showInspector() {
    _alice?.showInspector();
  }

  AliceDioInterceptor? getDioInterceptor() {
    return _alice?.getDioInterceptor();
  }
}
