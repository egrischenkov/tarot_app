import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/data/data_sources/profile_data_source.dart';
import 'package:taro/features/profile/data/models/user_model.dart';

class ProfileDataSourceMock extends Mock implements ProfileDataSource {}

class UserModelFake extends Fake implements UserModel {}
