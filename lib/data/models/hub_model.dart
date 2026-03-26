import 'package:sharexe/data/models/base_model.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';

class HubModel extends BaseModel {
  HubModel({
    required super.id,
    required super.createdAt,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    super.createdBy,
    super.deletedAt,
    super.lastModifiedAt,
    super.lastModifiedBy,
  });

  final String name;
  final String address;
  final double latitude;
  final double longitude;

  HubEntity toEntity() {
    return HubEntity(
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
