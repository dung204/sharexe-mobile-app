import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/repositories/hubs_repository.dart';

@injectable
class GetNearbyHubsUseCase {
  GetNearbyHubsUseCase(this._repository);

  final HubsRepository _repository;

  Future<Result<List<HubEntity>>> call({
    required double latitude,
    required double longitude,
  }) {
    return _repository.getNearbyHubs(latitude: latitude, longitude: longitude);
  }
}
