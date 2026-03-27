import 'package:sharexe/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Stream<LocationEntity> trackLocation();
  Future<LocationEntity?> getLastKnownLocation();
  Future<bool> requestPermission();
}
