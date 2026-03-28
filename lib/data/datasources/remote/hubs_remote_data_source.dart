import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sharexe/core/network/models/paged_response.dart';
import 'package:sharexe/core/network/models/success_response.dart';
import 'package:sharexe/data/models/hub_model.dart';

part '../../../generated/data/datasources/remote/hubs_remote_data_source.g.dart';

@RestApi()
@injectable
abstract class HubsRemoteDataSource {
  @factoryMethod
  factory HubsRemoteDataSource(Dio dio) = _HubsRemoteDataSource;

  @GET('/api/v1/hubs/search')
  Future<PagedResponse<HubModel>> searchHubs({
    @Query('keyword') required String keyword,
  });

  @GET('/api/v1/hubs/nearby')
  Future<SuccessResponse<List<HubModel>>> getNearbyHubs({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
  });
}
