import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

@injectable
class CheckAuthUseCase {
  CheckAuthUseCase(this._authRepository);

  final AuthRepository _authRepository;

  bool call() {
    return _authRepository.isSignedIn;
  }
}
