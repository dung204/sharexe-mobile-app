import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_location_entity.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@injectable
class GetCurrentLocationUseCase {
  GetCurrentLocationUseCase(this._locationRepository);

  final LocationRepository _locationRepository;

  Future<Result<UserLocationEntity>> call() async {
    return await _locationRepository.getCurrentLocation();
  }
}
