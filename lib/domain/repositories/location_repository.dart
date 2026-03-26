import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_location_entity.dart';

abstract class LocationRepository {
  Future<Result<UserLocationEntity>> getCurrentLocation();
}
