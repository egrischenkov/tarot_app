import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  final BaseDeviceInfo _baseDeviceInfo;
  final bool _isIos;

  DeviceInfoService({
    required BaseDeviceInfo baseDeviceInfo,
    required bool isIos,
  })  : _baseDeviceInfo = baseDeviceInfo,
        _isIos = isIos;

  bool isIPhoneSE() {
    if (!_isIos) {
      return false;
    }

    final iosInfo = IosDeviceInfo.fromMap(_baseDeviceInfo.data);
    final model = iosInfo.utsname.machine;

    return model == 'iPhone8,4' || model == 'iPhone12,8' || model == 'iPhone14,6';
  }
}
