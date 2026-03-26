import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entities/file_response_entity.freezed.dart';
part '../../generated/domain/entities/file_response_entity.g.dart';

@freezed
abstract class FileResponseEntity with _$FileResponseEntity {
  const factory FileResponseEntity({
    required String fileName,
    required String url,
  }) = _FileResponseEntity;

  factory FileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FileResponseEntityFromJson(json);
}
