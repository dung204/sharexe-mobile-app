import 'package:latlong2/latlong.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/route_entity.dart';

abstract class RouteRepository {
  Future<Result<RouteEntity>> getRoute(LatLng start, LatLng end);
}
