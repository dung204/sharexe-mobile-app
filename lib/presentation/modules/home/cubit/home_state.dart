import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/entities/route_entity.dart';

part '../../../../generated/presentation/modules/home/cubit/home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error(String message) = _Error;

  const factory HomeState.ready({
    required LatLng currentLocation,
    @Default([]) List<HubEntity> hubs,
    HubEntity? startHub,
    HubEntity? endHub,
    RouteEntity? currentRoute,
  }) = _Ready;
}
