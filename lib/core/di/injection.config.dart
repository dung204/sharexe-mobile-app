// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sharexe/app/bloc/app_bloc.dart' as _i575;
import 'package:sharexe/core/di/local_module.dart' as _i35;
import 'package:sharexe/core/firebase/firebase_module.dart' as _i735;
import 'package:sharexe/core/network/interceptors/auth_interceptor.dart'
    as _i590;
import 'package:sharexe/core/network/network_module.dart' as _i214;
import 'package:sharexe/core/services/alice_service.dart' as _i861;
import 'package:sharexe/core/services/connectivity_service.dart' as _i697;
import 'package:sharexe/core/services/language_service.dart' as _i365;
import 'package:sharexe/core/services/theme_service.dart' as _i323;
import 'package:sharexe/data/datasources/local/app_preferences.dart' as _i618;
import 'package:sharexe/data/datasources/local/local_data_source.dart' as _i792;
import 'package:sharexe/data/datasources/local/location_service.dart' as _i943;
import 'package:sharexe/data/datasources/local/users_local_data_source.dart'
    as _i261;
import 'package:sharexe/data/datasources/remote/auth_remote_data_source.dart'
    as _i85;
import 'package:sharexe/data/datasources/remote/firebase_service.dart' as _i970;
import 'package:sharexe/data/datasources/remote/hubs_remote_data_source.dart'
    as _i291;
import 'package:sharexe/data/datasources/remote/route_remote_data_source.dart'
    as _i160;
import 'package:sharexe/data/datasources/remote/users_remote_data_source.dart'
    as _i336;
import 'package:sharexe/data/repositories/auth_repository_impl.dart' as _i77;
import 'package:sharexe/data/repositories/hubs_repository_impl.dart' as _i428;
import 'package:sharexe/data/repositories/location_repository_impl.dart'
    as _i756;
import 'package:sharexe/data/repositories/route_repository_impl.dart' as _i106;
import 'package:sharexe/data/repositories/users_repository_impl.dart' as _i595;
import 'package:sharexe/domain/repositories/auth_repository.dart' as _i1010;
import 'package:sharexe/domain/repositories/hubs_repository.dart' as _i1043;
import 'package:sharexe/domain/repositories/location_repository.dart' as _i705;
import 'package:sharexe/domain/repositories/route_repository.dart' as _i864;
import 'package:sharexe/domain/repositories/users_repository.dart' as _i244;
import 'package:sharexe/domain/usecases/auth/check_auth_usecase.dart' as _i38;
import 'package:sharexe/domain/usecases/auth/sign_in_with_email_and_password_usecase.dart'
    as _i503;
import 'package:sharexe/domain/usecases/auth/sign_in_with_google_usecase.dart'
    as _i222;
import 'package:sharexe/domain/usecases/auth/sign_out_usecase.dart' as _i595;
import 'package:sharexe/domain/usecases/auth/sign_up_with_email_and_password_usecase.dart'
    as _i520;
import 'package:sharexe/domain/usecases/hubs/search_hubs_usecase.dart' as _i783;
import 'package:sharexe/domain/usecases/location/get_last_known_location_usecase.dart'
    as _i256;
import 'package:sharexe/domain/usecases/location/request_location_permission_usecase.dart'
    as _i591;
import 'package:sharexe/domain/usecases/location/track_location_usecase.dart'
    as _i818;
import 'package:sharexe/domain/usecases/route/get_route_usecase.dart' as _i5;
import 'package:sharexe/presentation/modules/auth/cubit/auth_cubit.dart'
    as _i598;
import 'package:sharexe/presentation/modules/home/cubit/home_cubit.dart'
    as _i684;
import 'package:sharexe/presentation/modules/onboarding/cubit/onboarding_cubit.dart'
    as _i684;
import 'package:sharexe/presentation/modules/search/cubit/search_cubit.dart'
    as _i485;
import 'package:sharexe/presentation/modules/splash/cubit/splash_cubit.dart'
    as _i703;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final localModule = _$LocalModule();
    final firebaseModule = _$FirebaseModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i697.ConnectivityService>(() => _i697.ConnectivityService());
    gh.factory<_i943.LocationService>(() => _i943.LocationService());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => localModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i590.AuthInterceptor>(() => _i590.AuthInterceptor());
    gh.lazySingleton<_i861.AliceService>(() => _i861.AliceService());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<_i861.AliceService>(),
        gh<_i590.AuthInterceptor>(),
      ),
    );
    gh.singleton<_i365.LanguageService>(
      () => _i365.LanguageService(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i323.ThemeService>(
      () => _i323.ThemeService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i792.LocalDataSource>(
      () => _i792.LocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i261.UsersLocalDataSource>(
      () => _i261.UsersLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i618.AppPreferences>(
      () => _i618.AppPreferences(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i336.UsersRemoteDataSource>(
      () => _i336.UsersRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i85.AuthRemoteDataSource>(
      () => _i85.AuthRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i291.HubsRemoteDataSource>(
      () => _i291.HubsRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i160.RouteRemoteDataSource>(
      () => _i160.RouteRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i703.SplashCubit>(
      () => _i703.SplashCubit(gh<_i618.AppPreferences>()),
    );
    gh.factory<_i684.OnboardingCubit>(
      () => _i684.OnboardingCubit(gh<_i618.AppPreferences>()),
    );
    gh.singleton<_i575.AppBloc>(
      () => _i575.AppBloc(
        gh<_i365.LanguageService>(),
        gh<_i323.ThemeService>(),
        gh<_i697.ConnectivityService>(),
      ),
    );
    gh.lazySingleton<_i970.FirebaseService>(
      () => _i970.FirebaseServiceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i1010.AuthRepository>(
      () => _i77.AuthRepositoryImpl(
        gh<_i970.FirebaseService>(),
        gh<_i85.AuthRemoteDataSource>(),
        gh<_i336.UsersRemoteDataSource>(),
        gh<_i261.UsersLocalDataSource>(),
      ),
    );
    gh.factory<_i1043.HubsRepository>(
      () => _i428.HubsRepositoryImpl(gh<_i291.HubsRemoteDataSource>()),
    );
    gh.factory<_i864.RouteRepository>(
      () => _i106.RouteRepositoryImpl(gh<_i160.RouteRemoteDataSource>()),
    );
    gh.factory<_i783.SearchHubsUseCase>(
      () => _i783.SearchHubsUseCase(gh<_i1043.HubsRepository>()),
    );
    gh.factory<_i503.SignInWithEmailAndPasswordUseCase>(
      () =>
          _i503.SignInWithEmailAndPasswordUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i520.SignUpWithEmailAndPasswordUseCase>(
      () =>
          _i520.SignUpWithEmailAndPasswordUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i222.SignInWithGoogleUseCase>(
      () => _i222.SignInWithGoogleUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i38.CheckAuthUseCase>(
      () => _i38.CheckAuthUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i595.SignOutUseCase>(
      () => _i595.SignOutUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i705.LocationRepository>(
      () => _i756.LocationRepositoryImpl(gh<_i943.LocationService>()),
    );
    gh.factory<_i256.GetLastKnownLocationUseCase>(
      () => _i256.GetLastKnownLocationUseCase(gh<_i705.LocationRepository>()),
    );
    gh.factory<_i485.SearchCubit>(
      () => _i485.SearchCubit(gh<_i783.SearchHubsUseCase>()),
    );
    gh.factory<_i244.UsersRepository>(
      () => _i595.UsersRepositoryImpl(gh<_i336.UsersRemoteDataSource>()),
    );
    gh.factory<_i818.TrackLocationUseCase>(
      () => _i818.TrackLocationUseCase(gh<_i705.LocationRepository>()),
    );
    gh.factory<_i591.RequestLocationPermissionUseCase>(
      () => _i591.RequestLocationPermissionUseCase(
        gh<_i705.LocationRepository>(),
      ),
    );
    gh.factory<_i5.GetRouteUseCase>(
      () => _i5.GetRouteUseCase(gh<_i864.RouteRepository>()),
    );
    gh.singleton<_i598.AuthCubit>(
      () => _i598.AuthCubit(
        gh<_i38.CheckAuthUseCase>(),
        gh<_i222.SignInWithGoogleUseCase>(),
        gh<_i520.SignUpWithEmailAndPasswordUseCase>(),
        gh<_i503.SignInWithEmailAndPasswordUseCase>(),
        gh<_i595.SignOutUseCase>(),
      ),
    );
    gh.factory<_i684.HomeCubit>(
      () => _i684.HomeCubit(
        gh<_i818.TrackLocationUseCase>(),
        gh<_i256.GetLastKnownLocationUseCase>(),
        gh<_i591.RequestLocationPermissionUseCase>(),
      ),
    );
    return this;
  }
}

class _$LocalModule extends _i35.LocalModule {}

class _$FirebaseModule extends _i735.FirebaseModule {}

class _$NetworkModule extends _i214.NetworkModule {}
