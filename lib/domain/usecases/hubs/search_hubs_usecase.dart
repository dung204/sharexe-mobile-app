import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/repositories/hubs_repository.dart';

@injectable
class SearchHubsUseCase {
  SearchHubsUseCase(this._hubsRepository);

  final HubsRepository _hubsRepository;

  Future<Result<List<HubEntity>>> call({required String keyword}) async {
    return _hubsRepository.searchHubs(keyword: keyword);
  }
}
