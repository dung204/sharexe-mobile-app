import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/remote/hubs_remote_data_source.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/repositories/hubs_repository.dart';

@Injectable(as: HubsRepository)
class HubsRepositoryImpl implements HubsRepository {
  HubsRepositoryImpl(this._hubsRemoteDataSource);

  final HubsRemoteDataSource _hubsRemoteDataSource;

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
}
