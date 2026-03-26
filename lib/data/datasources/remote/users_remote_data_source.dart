import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sharexe/core/network/models/success_response.dart';
import 'package:sharexe/data/models/user_model.dart';

part '../../../generated/data/datasources/remote/users_remote_data_source.g.dart';

@RestApi()
@injectable
abstract class UsersRemoteDataSource {
  @factoryMethod
  factory UsersRemoteDataSource(Dio dio) = _UsersRemoteDataSource;

  @GET('/api/v1/users/me')
  Future<SuccessResponse<UserModel>> getCurrentUser();
}
