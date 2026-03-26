import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/local/location_service.dart';
import 'package:sharexe/domain/entities/user_location_entity.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl(this._locationService);

  final LocationService _locationService;

  @override
  Future<Result<UserLocationEntity>> getCurrentLocation() async {
    try {
      final location = await _locationService.getCurrentLocation();
      return Result.success(
        UserLocationEntity(
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
