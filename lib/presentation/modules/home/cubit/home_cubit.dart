import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/usecases/location/get_current_location_use_case.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCurrentLocationUseCase) : super(const HomeState.initial());

  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  Future<void> initMapData() async {
    emit(const HomeState.loading());

    final locResult = await _getCurrentLocationUseCase.call();

    locResult.fold((failure) => emit(HomeState.error(failure.userMessage)), (
      location,
    ) {
      final currentLatLng = LatLng(location.latitude, location.longitude);

      // TODO: replace this one with API call
      final fakeHubs = [
        HubEntity(
          id: '1',
          name: 'Đại học FPT',
          address: 'Khu CNC',
          latitude: currentLatLng.latitude + 0.01,
          longitude: currentLatLng.longitude + 0.01,
        ),
        HubEntity(
          id: '2',
          name: 'BigC',
          address: 'Trần Duy Hưng',
          latitude: currentLatLng.latitude - 0.01,
          longitude: currentLatLng.longitude - 0.01,
        ),
      ];

      emit(HomeState.ready(currentLocation: currentLatLng, hubs: fakeHubs));
    });
  }

  Future<void> refetchCurrentLocation() async {
    final readyState = state.mapOrNull(ready: (s) => s);
    if (readyState == null) return;

    final locResult = await _getCurrentLocationUseCase.call();

    locResult.fold(
      (failure) {
        // TODO: Toast/Snackbar for error here
      },
      (location) {
        final newLatLng = LatLng(location.latitude, location.longitude);

        emit(readyState.copyWith(currentLocation: newLatLng));
      },
    );
  }
}
