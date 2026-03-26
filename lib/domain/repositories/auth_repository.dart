import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/user_entity.dart';

abstract class AuthRepository {
  bool get isSignedIn;
  Future<Result<UserEntity>> checkAuth();
  Future<Result<UserEntity>> signInWithGoogle();
  Future<Result<UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<void>> signOut();
}
