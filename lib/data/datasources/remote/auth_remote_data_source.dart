import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sharexe/core/network/models/success_response.dart';
import 'package:sharexe/data/models/user_model.dart';

part '../../../generated/data/datasources/remote/auth_remote_data_source.g.dart';

@RestApi()
@injectable
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/api/v1/auth/sync')
  Future<SuccessResponse<UserModel>> syncAuth();
}
