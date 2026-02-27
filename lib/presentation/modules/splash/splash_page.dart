import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharexe/configs/router/app_router.dart';
import 'package:sharexe/core/di/injection.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';
import 'package:sharexe/presentation/modules/splash/cubit/splash_cubit.dart';
import 'package:sharexe/presentation/modules/splash/cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            firstRun: () => context.go(AppRoutes.onboarding),
            authenticated: () => context.go(AppRoutes.auth),
            unauthenticated: () => context.go(AppRoutes.auth),
          );
        },
        child: Scaffold(
          backgroundColor: colorScheme.primary,
          body: Stack(
            children: [
              // App logo
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 127,
                      child: Assets.images.appLogoWithShadow.image(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'ShareXe',
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // City silhouette at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Assets.images.citySilhouette.image(
                  fit: BoxFit.contain,
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
