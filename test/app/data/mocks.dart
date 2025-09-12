import 'package:mocktail/mocktail.dart';
import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

class ThemeServiceMock extends Mock implements ThemeService {}

class LanguageServiceMock extends Mock implements LanguageService {}

class AppConfigurationsStorageMock extends Mock implements AppConfigurationsStorage {}
