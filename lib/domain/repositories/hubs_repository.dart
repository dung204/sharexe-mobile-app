import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';

abstract class HubsRepository {
  Future<Result<List<HubEntity>>> searchHubs({required String keyword});
  Future<Result<List<HubEntity>>> getNearbyHubs({
    required double latitude,
    required double longitude,
  });
}
