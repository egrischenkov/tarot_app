import 'package:flutter_alice/alice.dart';
import 'package:flutter_alice/core/alice_dio_interceptor.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/utils/http_inspector_service/http_inspector_service.dart';

final class AliceHttpInspectorService extends HttpInspectorService {
  Alice? _alice;

  @override
  void init() {
    _alice = Alice(
      navigatorKey: AppRouter.rootRouterGlobalKey,
    );
  }

  @override
  void showInspector() {
    _alice?.showInspector();
  }

  @override
  AliceDioInterceptor? getDioInterceptor() {
    return _alice?.getDioInterceptor();
  }
}
