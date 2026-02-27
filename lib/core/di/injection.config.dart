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
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sharexe/app/bloc/app_bloc.dart' as _i575;
import 'package:sharexe/core/di/local_module.dart' as _i35;
import 'package:sharexe/core/firebase/firebase_module.dart' as _i735;
import 'package:sharexe/core/network/network_module.dart' as _i214;
import 'package:sharexe/core/services/alice_service.dart' as _i861;
import 'package:sharexe/core/services/connectivity_service.dart' as _i697;
import 'package:sharexe/core/services/language_service.dart' as _i365;
import 'package:sharexe/core/services/theme_service.dart' as _i323;
import 'package:sharexe/data/datasources/local/app_preferences.dart' as _i618;
import 'package:sharexe/data/datasources/local/local_data_source.dart' as _i792;
import 'package:sharexe/data/datasources/local/user_local_data_source.dart'
    as _i916;
import 'package:sharexe/data/datasources/remote/firebase_service.dart' as _i970;
import 'package:sharexe/data/datasources/remote/todo_api_service.dart' as _i412;
import 'package:sharexe/data/datasources/remote/user_api_service.dart' as _i652;
import 'package:sharexe/data/repositories/auth_repository_impl.dart' as _i77;
import 'package:sharexe/data/repositories/todo_repository_impl.dart' as _i603;
import 'package:sharexe/data/repositories/user_repository_impl.dart' as _i238;
import 'package:sharexe/domain/repositories/auth_repository.dart' as _i1010;
import 'package:sharexe/domain/repositories/todo_repository.dart' as _i589;
import 'package:sharexe/domain/repositories/user_repository.dart' as _i806;
import 'package:sharexe/domain/usecases/check_auth_usecase.dart' as _i868;
import 'package:sharexe/domain/usecases/get_todo_by_id_usecase.dart' as _i302;
import 'package:sharexe/domain/usecases/get_todos_usecase.dart' as _i1005;
import 'package:sharexe/domain/usecases/get_user_by_id_usecase.dart' as _i241;
import 'package:sharexe/domain/usecases/get_users_usecase.dart' as _i875;
import 'package:sharexe/domain/usecases/update_todo_usecase.dart' as _i379;
import 'package:sharexe/presentation/modules/onboarding/cubit/onboarding_cubit.dart'
    as _i684;
import 'package:sharexe/presentation/modules/splash/cubit/splash_cubit.dart'
    as _i703;
import 'package:sharexe/presentation/modules/todo/cubit/todo_cubit.dart'
    as _i204;
import 'package:sharexe/presentation/modules/users/cubit/user_cubit.dart'
    as _i505;

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
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => localModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i861.AliceService>(() => _i861.AliceService());
    gh.singleton<_i365.LanguageService>(
      () => _i365.LanguageService(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i323.ThemeService>(
      () => _i323.ThemeService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i792.LocalDataSource>(
      () => _i792.LocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i916.UserLocalDataSource>(
      () => _i916.UserLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i618.AppPreferences>(
      () => _i618.AppPreferences(gh<_i460.SharedPreferences>()),
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
      () => _i970.FirebaseServiceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i861.AliceService>()),
    );
    gh.factory<_i1010.AuthRepository>(
      () => _i77.AuthRepositoryImpl(gh<_i970.FirebaseService>()),
    );
    gh.factory<_i868.CheckAuthUseCase>(
      () => _i868.CheckAuthUseCase(gh<_i1010.AuthRepository>()),
    );
    gh.factory<_i412.TodoApiService>(
      () => _i412.TodoApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i652.UserApiService>(
      () => _i652.UserApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i703.SplashCubit>(
      () => _i703.SplashCubit(
        gh<_i868.CheckAuthUseCase>(),
        gh<_i618.AppPreferences>(),
      ),
    );
    gh.factory<_i589.TodoRepository>(
      () => _i603.TodoRepositoryImpl(gh<_i412.TodoApiService>()),
    );
    gh.factory<_i806.UserRepository>(
      () => _i238.UserRepositoryImpl(
        gh<_i652.UserApiService>(),
        gh<_i916.UserLocalDataSource>(),
      ),
    );
    gh.factory<_i875.GetUsersUseCase>(
      () => _i875.GetUsersUseCase(gh<_i806.UserRepository>()),
    );
    gh.factory<_i241.GetUserByIdUseCase>(
      () => _i241.GetUserByIdUseCase(gh<_i806.UserRepository>()),
    );
    gh.factory<_i1005.GetTodosUseCase>(
      () => _i1005.GetTodosUseCase(gh<_i589.TodoRepository>()),
    );
    gh.factory<_i302.GetTodoByIdUseCase>(
      () => _i302.GetTodoByIdUseCase(gh<_i589.TodoRepository>()),
    );
    gh.factory<_i379.UpdateTodoUseCase>(
      () => _i379.UpdateTodoUseCase(gh<_i589.TodoRepository>()),
    );
    gh.factory<_i505.UserCubit>(
      () => _i505.UserCubit(gh<_i875.GetUsersUseCase>()),
    );
    gh.factory<_i204.TodoCubit>(
      () => _i204.TodoCubit(
        gh<_i1005.GetTodosUseCase>(),
        gh<_i379.UpdateTodoUseCase>(),
      ),
    );
    return this;
  }
}

class _$LocalModule extends _i35.LocalModule {}

class _$FirebaseModule extends _i735.FirebaseModule {}

class _$NetworkModule extends _i214.NetworkModule {}
