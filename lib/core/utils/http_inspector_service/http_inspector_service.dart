import 'package:dio/dio.dart';

abstract class HttpInspectorService {
  void init();

  void showInspector();

  InterceptorsWrapper? getDioInterceptor();
}
