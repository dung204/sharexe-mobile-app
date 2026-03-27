// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/hub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HubModel _$HubModelFromJson(Map<String, dynamic> json) => HubModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  name: json['name'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  isActive: json['isActive'] as bool,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  createdBy: json['createdBy'] as String?,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  lastModifiedAt: json['lastModifiedAt'] == null
      ? null
      : DateTime.parse(json['lastModifiedAt'] as String),
  lastModifiedBy: json['lastModifiedBy'] as String?,
);

Map<String, dynamic> _$HubModelToJson(HubModel instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'createdBy': instance.createdBy,
  'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
  'lastModifiedBy': instance.lastModifiedBy,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'name': instance.name,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'isActive': instance.isActive,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
};
