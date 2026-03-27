import 'package:json_annotation/json_annotation.dart';
import 'package:sharexe/data/models/base_model.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';

part '../../generated/data/models/hub_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HubModel extends BaseModel {
  HubModel({
    required super.id,
    required super.createdAt,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    this.description,
    this.imageUrl,
    super.createdBy,
    super.deletedAt,
    super.lastModifiedAt,
    super.lastModifiedBy,
  });

  factory HubModel.fromJson(Map<String, dynamic> json) =>
      _$HubModelFromJson(json);

  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final bool isActive;
  final String? description;
  final String? imageUrl;

  Map<String, dynamic> toJson() => _$HubModelToJson(this);

  HubEntity toEntity() {
    return HubEntity(
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
      description: description,
      imageUrl: imageUrl,
    );
  }
}
