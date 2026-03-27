import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@injectable
class RequestLocationPermissionUseCase {
  RequestLocationPermissionUseCase(this._locationRepository);

  final LocationRepository _locationRepository;

  Future<bool> call() async {
    return await _locationRepository.requestPermission();
  }
}
