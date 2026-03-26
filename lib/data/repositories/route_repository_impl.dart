import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/remote/route_remote_data_source.dart';
import 'package:sharexe/domain/entities/route_entity.dart';
import 'package:sharexe/domain/repositories/route_repository.dart';

@Injectable(as: RouteRepository)
class RouteRepositoryImpl implements RouteRepository {
  RouteRepositoryImpl(this._remoteDataSource);
  final RouteRemoteDataSource _remoteDataSource;

  @override
  Future<Result<RouteEntity>> getRoute(LatLng start, LatLng end) async {
    try {
      final route = await _remoteDataSource.getRoute(start, end);
      return Result.success(route);
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
