import 'package:injectable/injectable.dart';
import 'package:sharexe/data/datasources/local/location_service.dart';
import 'package:sharexe/domain/entities/location_entity.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl(this._locationService);

  final LocationService _locationService;

  @override
  Stream<LocationEntity> trackLocation() {
    return _locationService.getPositionStream().map(
      (position) => LocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
    );
  }

  @override
  Future<LocationEntity?> getLastKnownLocation() async {
    final position = await _locationService.getLastKnownLocation();
    if (position != null) {
      return LocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    }
    return null;
  }

  @override
  Future<bool> requestPermission() async {
    return await _locationService.checkAndRequestPermission();
  }
}
