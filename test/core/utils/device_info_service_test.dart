import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/core/utils/device_info_service.dart';

// Мок для BaseDeviceInfo
class BaseDeviceInfoMock extends Mock implements BaseDeviceInfo {}

// Helper для генерации полного IosDeviceInfo.data
Map<String, dynamic> iosDeviceInfoMap(String machine) {
  return {
    'name': 'iPhone',
    'systemName': 'iOS',
    'systemVersion': '15.0',
    'model': 'iPhone',
    'modelName': 'iPhone',
    'localizedModel': 'iPhone',
    'identifierForVendor': '12345678-1234-1234-1234-1234567890ab',
    'freeDiskSize': 0,
    'totalDiskSize': 0,
    'isPhysicalDevice': true,
    'physicalRamSize': 0,
    'availableRamSize': 0,
    'isiOSAppOnMac': false,
    'utsname': {
      'sysname': 'Darwin',
      'nodename': 'iPhone',
      'release': '21.0.0',
      'version': 'Darwin Kernel Version 21.0.0',
      'machine': machine,
    },
  };
}

void main() {
  late BaseDeviceInfoMock baseDeviceInfoMock;

  setUp(() {
    baseDeviceInfoMock = BaseDeviceInfoMock();
  });

  group('DeviceInfoService.isIPhoneSE', () {
    test('returns false if not iOS', () {
      final service = DeviceInfoService(
        baseDeviceInfo: baseDeviceInfoMock,
        isIos: false,
      );

      expect(service.isIPhoneSE(), false);
      verifyNever(() => baseDeviceInfoMock.data);
    });

    test('returns true for iPhone SE 1st gen (iPhone8,4)', () {
      when(() => baseDeviceInfoMock.data).thenReturn(iosDeviceInfoMap('iPhone8,4'));

      final service = DeviceInfoService(
        baseDeviceInfo: baseDeviceInfoMock,
        isIos: true,
      );

      expect(service.isIPhoneSE(), true);
    });

    test('returns true for iPhone SE 2nd gen (iPhone12,8)', () {
      when(() => baseDeviceInfoMock.data).thenReturn(iosDeviceInfoMap('iPhone12,8'));

      final service = DeviceInfoService(
        baseDeviceInfo: baseDeviceInfoMock,
        isIos: true,
      );

      expect(service.isIPhoneSE(), true);
    });

    test('returns true for iPhone SE 3rd gen (iPhone14,6)', () {
      when(() => baseDeviceInfoMock.data).thenReturn(iosDeviceInfoMap('iPhone14,6'));

      final service = DeviceInfoService(
        baseDeviceInfo: baseDeviceInfoMock,
        isIos: true,
      );

      expect(service.isIPhoneSE(), true);
    });

    test('returns false for other iPhone models', () {
      when(() => baseDeviceInfoMock.data).thenReturn(iosDeviceInfoMap('iPhone13,4'));

      final service = DeviceInfoService(
        baseDeviceInfo: baseDeviceInfoMock,
        isIos: true,
      );

      expect(service.isIPhoneSE(), false);
    });
  });
}
