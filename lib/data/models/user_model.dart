import 'package:json_annotation/json_annotation.dart';
import 'package:sharexe/data/models/base_model.dart';
import 'package:sharexe/data/models/file_response_model.dart';
import 'package:sharexe/domain/entities/user_entity.dart';

part '../../generated/data/models/user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends BaseModel {
  UserModel({
    required super.id,
    required super.createdAt,
    required this.role,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.dateOfBirth,
    super.createdBy,
    super.lastModifiedAt,
    super.lastModifiedBy,
    super.deletedAt,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      createdAt: user.createdAt,
      createdBy: user.createdBy,
      lastModifiedAt: user.lastModifiedAt,
      lastModifiedBy: user.lastModifiedBy,
      deletedAt: user.deletedAt,
      role: user.role,
      email: user.email,
      fullName: user.fullName,
      gender: user.gender,
      dateOfBirth: user.dateOfBirth,
      avatar: user.avatar != null
          ? FileResponseModel.fromEntity(user.avatar!)
          : null,
    );
  }

  final String role;
  final String? email;
  final String? fullName;
  final String? gender;
  final DateTime? dateOfBirth;
  final FileResponseModel? avatar;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      createdAt: createdAt,
      createdBy: createdBy,
      lastModifiedAt: lastModifiedAt,
      lastModifiedBy: lastModifiedBy,
      deletedAt: deletedAt,
      role: role,
      email: email,
      fullName: fullName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      avatar: avatar?.toEntity(),
    );
  }
}
