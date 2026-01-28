import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sharexe/data/datasources/local/app_preferences.dart';
import 'package:sharexe/domain/usecases/check_auth_usecase.dart';
import 'package:sharexe/presentation/modules/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._checkAuthUseCase, this._appPreferences)
    : super(const SplashState.initial());

  final AppPreferences _appPreferences;
  final CheckAuthUseCase _checkAuthUseCase;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    if (_appPreferences.isFirstRun) {
      emit(const SplashState.firstRun());
      return;
    }

    final isLoggedIn = _checkAuthUseCase.call();

    emit(
      isLoggedIn
          ? const SplashState.authenticated()
          : const SplashState.unauthenticated(),
    );
  }
}
