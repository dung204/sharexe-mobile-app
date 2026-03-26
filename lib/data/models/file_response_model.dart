import 'package:json_annotation/json_annotation.dart';
import 'package:sharexe/domain/entities/file_response_entity.dart';

part '../../generated/data/models/file_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FileResponseModel {
  const FileResponseModel({required this.fileName, required this.url});

  factory FileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FileResponseModelFromJson(json);

  factory FileResponseModel.fromEntity(FileResponseEntity entity) {
    return FileResponseModel(fileName: entity.fileName, url: entity.url);
  }

  final String fileName;
  final String url;

  Map<String, dynamic> toJson() => _$FileResponseModelToJson(this);

  FileResponseEntity toEntity() {
    return FileResponseEntity(fileName: fileName, url: url);
  }
}
