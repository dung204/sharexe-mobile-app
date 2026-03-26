import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharexe/domain/entities/base_entity.dart';
import 'package:sharexe/domain/entities/file_response_entity.dart';

part '../../generated/domain/entities/user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity implements BaseEntity {
  const factory UserEntity({
    required String id,
    required DateTime createdAt,
    required String role,
    String? createdBy,
    DateTime? lastModifiedAt,
    String? lastModifiedBy,
    DateTime? deletedAt,
    String? email,
    String? fullName,
    String? gender,
    DateTime? dateOfBirth,
    FileResponseEntity? avatar,
  }) = _UserEntity;
}
