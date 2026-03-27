import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/entities/location_entity.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@injectable
class TrackLocationUseCase {
  TrackLocationUseCase(this._locationRepository);

  final LocationRepository _locationRepository;

  Stream<LocationEntity> call() {
    return _locationRepository.trackLocation();
  }
}
