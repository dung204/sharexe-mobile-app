import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/core/utils/polyline_decoder.dart';
import 'package:sharexe/domain/entities/route_entity.dart';

@injectable
class RouteRemoteDataSource {
  RouteRemoteDataSource(this._dio);
  final Dio _dio;

  Future<RouteEntity> getRoute(LatLng start, LatLng end) async {
    final url =
        'http://router.project-osrm.org/route/v1/driving/'
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}'
        '?geometries=polyline';

    final response = await _dio.get(url);

    if (response.statusCode == 200 && response.data['routes'] != null) {
      final routeData = response.data['routes'][0];
      return RouteEntity(
        points: PolylineDecoder.decode(routeData['geometry']),
        distance: (routeData['distance'] as num).toDouble(),
        duration: (routeData['duration'] as num).toDouble(),
      );
    }
    throw Exception('Không tìm thấy đường đi');
  }
}
