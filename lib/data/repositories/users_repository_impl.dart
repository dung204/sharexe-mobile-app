import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/remote/users_remote_data_source.dart';
import 'package:sharexe/domain/entities/user_entity.dart';
import 'package:sharexe/domain/repositories/users_repository.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._remoteDataSource);

  final UsersRemoteDataSource _remoteDataSource;

  @override
  Future<Result<UserEntity>> getCurrentUser() async {
    try {
      final response = await _remoteDataSource.getCurrentUser();

      if (response.success && response.data != null) {
        return Result.success(response.data!.toEntity());
      } else {
        return Result.failure(Failure.server(message: response.message));
      }
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }
}
