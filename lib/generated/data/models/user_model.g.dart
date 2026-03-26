// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  role: json['role'] as String,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  gender: json['gender'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  createdBy: json['createdBy'] as String?,
  lastModifiedAt: json['lastModifiedAt'] == null
      ? null
      : DateTime.parse(json['lastModifiedAt'] as String),
  lastModifiedBy: json['lastModifiedBy'] as String?,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  avatar: json['avatar'] == null
      ? null
      : FileResponseModel.fromJson(json['avatar'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'createdBy': instance.createdBy,
  'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
  'lastModifiedBy': instance.lastModifiedBy,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'role': instance.role,
  'email': instance.email,
  'fullName': instance.fullName,
  'gender': instance.gender,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'avatar': instance.avatar?.toJson(),
};
