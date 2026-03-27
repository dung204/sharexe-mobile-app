import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/entities/location_entity.dart';
import 'package:sharexe/domain/usecases/location/get_last_known_location_usecase.dart';
import 'package:sharexe/domain/usecases/location/request_location_permission_usecase.dart';
import 'package:sharexe/domain/usecases/location/track_location_usecase.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._trackLocationUseCase,
    this._getLastKnownLocationUseCase,
    this._requestLocationPermissionUseCase,
  ) : super(const HomeState.initial());

  final RequestLocationPermissionUseCase _requestLocationPermissionUseCase;
  final GetLastKnownLocationUseCase _getLastKnownLocationUseCase;
  final TrackLocationUseCase _trackLocationUseCase;

  final LatLng _defaultLocation = const LatLng(21.028511, 105.804817); // Hanoi

  StreamSubscription<LocationEntity>? _locationSubscription;

  Future<void> initMapData() async {
    emit(const HomeState.loading());

    final hasPermission = await _requestLocationPermissionUseCase.call();

    if (!hasPermission) {
      emit(
        HomeState.ready(
          currentLocation: _defaultLocation,
          hubs: [],
          startHub: null,
          endHub: null,
          currentRoute: null,
        ),
      );

      return;
    }

    final lastKnownLoc = await _getLastKnownLocationUseCase.call();

    final initialLoc = lastKnownLoc != null
        ? LatLng(lastKnownLoc.latitude, lastKnownLoc.longitude)
        : _defaultLocation;

    emit(
      HomeState.ready(
        currentLocation: initialLoc,
        hubs: [
          HubEntity(
            id: 'hub1',
            name: 'Hub 1',
            address: 'Address 1',
            latitude: initialLoc.latitude + 0.01,
            longitude: initialLoc.longitude + 0.01,
          ),
          HubEntity(
            id: 'hub2',
            name: 'Hub 2',
            address: 'Address 2',
            latitude: initialLoc.latitude - 0.01,
            longitude: initialLoc.longitude - 0.01,
          ),
        ], // TODO: Load hubs from API
        startHub: null,
        endHub: null,
        currentRoute: null,
      ),
    );
    _startTrackingLocation();
  }

  void _startTrackingLocation() {
    _locationSubscription?.cancel();

    _locationSubscription = _trackLocationUseCase.call().listen((location) {
      final readyState = state.mapOrNull(ready: (s) => s);
      if (readyState == null) return;

      final newLatLng = LatLng(location.latitude, location.longitude);

      emit(readyState.copyWith(currentLocation: newLatLng));
    });
  }

  void selectHub(HubEntity hub) {
    state.mapOrNull(
      ready: (readyState) {
        emit(readyState.copyWith(selectedHub: hub));
      },
    );
  }

  void clearSelectedHub() {
    state.mapOrNull(
      ready: (readyState) {
        emit(readyState.copyWith(selectedHub: null));
      },
    );
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}
