import 'package:injectable/injectable.dart';
import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/data/datasources/local/users_local_data_source.dart';
import 'package:sharexe/data/datasources/remote/auth_remote_data_source.dart';
import 'package:sharexe/data/datasources/remote/firebase_service.dart';
import 'package:sharexe/data/datasources/remote/users_remote_data_source.dart';
import 'package:sharexe/domain/entities/user_entity.dart';
import 'package:sharexe/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._firebaseService,
    this._authRemoteDataSource,
    this._usersRemoteDataSource,
    this._usersLocalDataSource,
  );

  final FirebaseService _firebaseService;
  final AuthRemoteDataSource _authRemoteDataSource;
  final UsersRemoteDataSource _usersRemoteDataSource;
  final UsersLocalDataSource _usersLocalDataSource;

  @override
  bool get isSignedIn => _firebaseService.isSignedIn;

  @override
  Future<Result<UserEntity>> checkAuth() async {
    try {
      if (!_firebaseService.isSignedIn) {
        await _usersLocalDataSource.clearCurrentUser();
        return const Result.failure(
          Failure.unauthorized(message: 'Not signed in to Firebase'),
        );
      }

      try {
        final response = await _usersRemoteDataSource.getCurrentUser();
        if (response.success && response.data != null) {
          await _usersLocalDataSource.cacheCurrentUser(response.data!);
          return Result.success(response.data!.toEntity());
        }
      } catch (e) {
        final cachedUser = await _usersLocalDataSource.getCachedCurrentUser();
        if (cachedUser != null) {
          return Result.success(cachedUser.toEntity());
        }
      }

      final syncResponse = await _authRemoteDataSource.syncAuth();
      if (syncResponse.success && syncResponse.data != null) {
        await _usersLocalDataSource.cacheCurrentUser(syncResponse.data!);
        return Result.success(syncResponse.data!.toEntity());
      }

      return const Result.failure(
        Failure.server(message: 'Failed to authenticate and sync'),
      );
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithGoogle() async {
    try {
      await _firebaseService.signInWithGoogle();
      return await _syncUserWithBackend();
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseService.signUpWithEmailAndPassword(email, password);
      return await _syncUserWithBackend();
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseService.signInWithEmailAndPassword(email, password);
      return await _syncUserWithBackend();
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }

  Future<Result<UserEntity>> _syncUserWithBackend() async {
    try {
      final response = await _authRemoteDataSource.syncAuth();

      if (response.success && response.data != null) {
        await _usersLocalDataSource.cacheCurrentUser(response.data!);

        return Result.success(response.data!.toEntity());
      } else {
        return Result.failure(
          Failure.server(
            message: response.message ?? 'Unknown server error during sync',
          ),
        );
      }
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _firebaseService.signOut();
      await _usersLocalDataSource.clearCurrentUser();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.server(message: e.toString()));
    }
  }
}
