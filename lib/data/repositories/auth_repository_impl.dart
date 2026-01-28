import 'package:sharexe/data/datasources/remote/firebase_service.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._firebaseService);

  final FirebaseService _firebaseService;

  @override
  bool get isSignedIn => _firebaseService.isSignedIn;
}
