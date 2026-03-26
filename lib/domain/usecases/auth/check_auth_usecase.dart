import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_entity.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

@injectable
class CheckAuthUseCase {
  CheckAuthUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Result<UserEntity>> call() async {
    return _authRepository.checkAuth();
  }
}
