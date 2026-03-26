import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_entity.dart';

abstract class UsersRepository {
  Future<Result<UserEntity>> getCurrentUser();
}
