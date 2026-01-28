import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sharexe/domain/usecases/check_auth_usecase.dart';
import 'package:sharexe/presentation/modules/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._checkAuthUseCase) : super(const SplashState.initial());

  final CheckAuthUseCase _checkAuthUseCase;

  Future<void> init() async {
    final [_, isLoggedIn as bool] = await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      Future.value(_checkAuthUseCase.call()),
    ]);

    emit(
      isLoggedIn
          ? const SplashState.authenticated()
          : const SplashState.unauthenticated(),
    );
  }
}
