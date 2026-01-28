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
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            firstRun: () => context.go(AppRoutes.onboarding),
            authenticated: () => context.go(AppRoutes.home),
            unauthenticated: () => context.go(AppRoutes.home),
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF40D6AC),
          body: Stack(
            children: [
              // App logo
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Assets.images.appLogo.image(),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'ShareXe',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
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
                  color: Colors.white.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
