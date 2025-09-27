import 'package:equatable/equatable.dart';
import 'package:taro/features/profile/domain/entities/gender.dart';
import 'package:taro/features/profile/domain/entities/marital_status.dart';

class User extends Equatable {
  final String email;
  final String name;
  final String? birthDate;
  final String? job;
  final Gender? gender;
  final MaritalStatus? maritalStatus;

  const User({
    required this.email,
    required this.name,
    this.birthDate,
    this.job,
    this.gender,
    this.maritalStatus,
  });

  factory User.empty() {
    return const User(
      email: '',
      name: '',
    );
  }

  @override
  List<Object?> get props => [
        email,
        name,
        birthDate,
        job,
        gender,
        maritalStatus,
      ];
}
