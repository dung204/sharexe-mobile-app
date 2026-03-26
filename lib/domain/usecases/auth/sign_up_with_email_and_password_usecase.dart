import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_entity.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

@injectable
class SignUpWithEmailAndPasswordUseCase {
  const SignUpWithEmailAndPasswordUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<UserEntity>> call(String email, String password) {
    return _repository.signUpWithEmailAndPassword(email, password);
  }
}
