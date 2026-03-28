import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/local/hubs_local_data_source.dart';
import 'package:sharexe/data/datasources/remote/hubs_remote_data_source.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/repositories/hubs_repository.dart';

@Injectable(as: HubsRepository)
class HubsRepositoryImpl implements HubsRepository {
  HubsRepositoryImpl(this._hubsRemoteDataSource, this._hubsLocalDataSource);

  final HubsRemoteDataSource _hubsRemoteDataSource;
  final HubsLocalDataSource _hubsLocalDataSource;

  @override
  Future<Result<List<HubEntity>>> searchHubs({required String keyword}) async {
    try {
      final response = await _hubsRemoteDataSource.searchHubs(keyword: keyword);

      if (response.success) {
        final entities = response.data
            .map((model) => model.toEntity())
            .toList();
        return Result.success(entities);
      } else {
        return Result.failure(Failure.server(message: response.message));
      }
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<List<HubEntity>>> getNearbyHubs({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _hubsRemoteDataSource.getNearbyHubs(
        latitude: latitude,
        longitude: longitude,
      );

      if (response.success) {
        final models = response.data ?? [];
        // Optionally cache the first 100 or something, but let's just cache what we get
        await _hubsLocalDataSource.cacheNearbyHubs(models.take(100).toList());
        final entities = models.map((m) => m.toEntity()).toList();
        return Result.success(entities);
      } else {
        return _fetchLocalNearbyHubs();
      }
    } catch (e) {
      return _fetchLocalNearbyHubs();
    }
  }

  Future<Result<List<HubEntity>>> _fetchLocalNearbyHubs() async {
    try {
      final localHubs = await _hubsLocalDataSource.getCachedNearbyHubs();
      if (localHubs.isNotEmpty) {
        final entities = localHubs.map((m) => m.toEntity()).toList();
        return Result.success(entities);
      } else {
        return const Result.failure(
          Failure.server(message: 'No cached hubs available'),
        );
      }
    } catch (e) {
      return const Result.failure(Failure.server(message: 'Cache error'));
    }
  }
}
