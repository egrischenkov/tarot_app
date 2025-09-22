import 'package:json_annotation/json_annotation.dart';
import 'package:taro/features/profile/domain/entities/gender.dart';
import 'package:taro/features/profile/domain/entities/marital_status.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final String name;
  final String? birthDate;
  final String? job;
  final Gender? gender;
  final MaritalStatus? maritalStatus;

  const UserModel({
    required this.email,
    required this.name,
    this.birthDate,
    this.job,
    this.gender,
    this.maritalStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
