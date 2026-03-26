import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

@injectable
class SignOutUseCase {
  SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> call() async {
    await _authRepository.signOut();
  }
}
