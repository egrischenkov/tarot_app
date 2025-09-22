// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      birthDate: json['birth_date'] as String?,
      job: json['job'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      maritalStatus:
          $enumDecodeNullable(_$MaritalStatusEnumMap, json['marital_status']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'birth_date': instance.birthDate,
      'job': instance.job,
      'gender': _$GenderEnumMap[instance.gender],
      'marital_status': _$MaritalStatusEnumMap[instance.maritalStatus],
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$MaritalStatusEnumMap = {
  MaritalStatus.single: 'single',
  MaritalStatus.inLove: 'inLove',
  MaritalStatus.complicated: 'complicated',
  MaritalStatus.inRelationship: 'inRelationship',
  MaritalStatus.engaged: 'engaged',
  MaritalStatus.married: 'married',
  MaritalStatus.divorced: 'divorced',
  MaritalStatus.widowed: 'widowed',
};
