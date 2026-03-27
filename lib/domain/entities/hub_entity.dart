import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/base_entity.dart';

part '../../generated/domain/entities/hub_entity.freezed.dart';

@freezed
abstract class HubEntity with _$HubEntity implements BaseEntity {
  const factory HubEntity({
    required String id,
    required DateTime createdAt,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    required bool isActive,
    String? description,
    String? imageUrl,
    String? createdBy,
    DateTime? lastModifiedAt,
    String? lastModifiedBy,
    DateTime? deletedAt,
  }) = _HubEntity;
  const HubEntity._();

  LatLng get latLng => LatLng(latitude, longitude);
}
