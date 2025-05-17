import 'dart:developer';

import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  late final PackageInfo _packageInfo;

  String get appName => _packageInfo.appName;

  String get packageName => _packageInfo.packageName;

  String get version => _packageInfo.version;

  String get buildNumber => _packageInfo.buildNumber;

  String? get installerStore => _packageInfo.installerStore;

  String get appVersion => '$version+$buildNumber';

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    log('[Package Info] appName: $appName | packageName: $packageName | version: $version | buildNumber: $buildNumber');
  }
}
