import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/presentation/modules/splash/cubit/splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;
  const factory SplashState.firstRun() = SplashFirstRun;
  const factory SplashState.unauthenticated() = SplashUnauthenticated;
  const factory SplashState.authenticated() = SplashAuthenticated;
}
