import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/configs/router/go_router_refresh_stream.dart';
import 'package:sharexe/core/di/injection.dart';
import 'package:sharexe/data/datasources/local/app_preferences.dart';
import 'package:sharexe/presentation/modules/auth/auth_page.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_cubit.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_state.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_cubit.dart';
import 'package:sharexe/presentation/modules/home/home_page.dart';
import 'package:sharexe/presentation/modules/onboarding/onboarding_page.dart';
import 'package:sharexe/presentation/modules/splash/splash_page.dart';
import 'package:sharexe/presentation/shared/global_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String home = '/home';
}

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(getIt<AuthCubit>().stream),

    redirect: (context, state) {
      final authState = getIt<AuthCubit>().state;
      final isFirstRun = getIt<AppPreferences>().isFirstRun;

      final isGoingToSplash = state.matchedLocation == AppRoutes.splash;
      final isGoingToOnboarding = state.matchedLocation == AppRoutes.onboarding;
      final isGoingToAuth = state.matchedLocation == AppRoutes.auth;

      if (isGoingToSplash) {
        return null;
      }

      if (isFirstRun) {
        return isGoingToOnboarding ? null : AppRoutes.onboarding;
      }

      return authState.maybeWhen(
        authenticated: (_) {
          if (isGoingToAuth || isGoingToOnboarding) return AppRoutes.home;
          return null;
        },
        unauthenticated: () {
          if (!isGoingToAuth && !isGoingToOnboarding) return AppRoutes.auth;
          return null;
        },
        orElse: () {
          return null;
        },
      );
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..initMapData(),
          child: const HomePage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const GlobalErrorScreen(),
  );
}
