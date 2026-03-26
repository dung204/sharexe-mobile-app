// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/file_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponseModel _$FileResponseModelFromJson(Map<String, dynamic> json) =>
    FileResponseModel(
      fileName: json['fileName'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FileResponseModelToJson(FileResponseModel instance) =>
    <String, dynamic>{'fileName': instance.fileName, 'url': instance.url};
