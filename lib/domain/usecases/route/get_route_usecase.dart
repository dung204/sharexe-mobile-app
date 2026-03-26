import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/route_entity.dart';
import 'package:sharexe/domain/repositories/route_repository.dart';

@injectable
class GetRouteUseCase {
  GetRouteUseCase(this._repository);
  final RouteRepository _repository;

  Future<Result<RouteEntity>> call(LatLng start, LatLng end) async {
    return await _repository.getRoute(start, end);
  }
}
