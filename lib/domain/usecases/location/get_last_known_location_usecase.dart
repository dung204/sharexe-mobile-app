import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/entities/location_entity.dart';
import 'package:sharexe/domain/repositories/location_repository.dart';

@injectable
class GetLastKnownLocationUseCase {
  GetLastKnownLocationUseCase(this._repository);

  final LocationRepository _repository;

  Future<LocationEntity?> call() {
    return _repository.getLastKnownLocation();
  }
}
