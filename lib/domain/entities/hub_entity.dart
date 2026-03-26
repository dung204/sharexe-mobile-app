import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part '../../generated/domain/entities/hub_entity.freezed.dart';

@freezed
abstract class HubEntity with _$HubEntity {
  const factory HubEntity({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
  }) = _HubEntity;
  const HubEntity._();

  LatLng get latLng => LatLng(latitude, longitude);
}
