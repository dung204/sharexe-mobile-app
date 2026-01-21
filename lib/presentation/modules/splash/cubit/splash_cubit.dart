import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sharexe/presentation/modules/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  // TODO: Inject check authentication use case
  SplashCubit() : super(const SplashState.initial());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    await _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // TODO: Implement authentication status check
    emit(const SplashState.authenticated());
  }
}
