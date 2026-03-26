import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/usecases/auth/check_auth_usecase.dart';
import 'package:sharexe/domain/usecases/auth/sign_in_with_google_usecase.dart';
import 'package:sharexe/domain/usecases/auth/sign_up_with_email_and_password_usecase.dart';
import 'package:sharexe/domain/usecases/auth/sign_in_with_email_and_password_usecase.dart';
import 'package:sharexe/domain/usecases/auth/sign_out_usecase.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._checkAuthUseCase,
    this._signInWithGoogleUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signInWithEmailAndPasswordUseCase,
    this._signOutUseCase,
  ) : super(const AuthState.initial());

  final CheckAuthUseCase _checkAuthUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  Future<void> checkAuth() async {
    emit(const AuthState.loading());

    final result = await _checkAuthUseCase.call();

    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    final result = await _signInWithGoogleUseCase();

    result.fold(
      (failure) => emit(AuthState.error(failure.userMessage)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _signUpWithEmailAndPasswordUseCase(email, password);

    result.fold(
      (failure) => emit(AuthState.error(failure.userMessage)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _signInWithEmailAndPasswordUseCase(email, password);

    result.fold(
      (failure) => emit(AuthState.error(failure.userMessage)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    await _signOutUseCase();
    emit(const AuthState.unauthenticated());
  }
}
