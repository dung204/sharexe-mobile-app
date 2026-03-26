import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class RouteEntity extends Equatable {
  const RouteEntity({
    required this.points,
    required this.distance,
    required this.duration,
  });

  final List<LatLng> points;
  final double distance;
  final double duration;

  @override
  List<Object> get props => [points, distance, duration];
}
