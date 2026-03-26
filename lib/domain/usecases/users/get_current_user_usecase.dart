import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_entity.dart';
import 'package:sharexe/domain/repositories/users_repository.dart';

class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this._usersRepository);

  final UsersRepository _usersRepository;

  Future<Result<UserEntity>> call() {
    return _usersRepository.getCurrentUser();
  }
}
