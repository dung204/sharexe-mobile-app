// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../domain/entities/file_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileResponseEntity _$FileResponseEntityFromJson(Map<String, dynamic> json) =>
    _FileResponseEntity(
      fileName: json['fileName'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FileResponseEntityToJson(_FileResponseEntity instance) =>
    <String, dynamic>{'fileName': instance.fileName, 'url': instance.url};
