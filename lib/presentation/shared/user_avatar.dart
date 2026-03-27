import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_cubit.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_state.dart';
import 'package:sharexe/presentation/shared/app_avatar.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.imageUrl,
    this.radius = 24.0,
    this.onTap,
    this.borderWidth = 0.0,
    this.borderColor,
    this.hasShadow = false,
  });

  final String? imageUrl;
  final double radius;
  final VoidCallback? onTap;

  final double borderWidth;
  final Color? borderColor;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) => authState.maybeWhen(
        loading: () => const AppAvatar.skeleton(radius: 24.0),

        authenticated: (user) => AppAvatar(
          imageUrl: user.avatar?.url,
          radius: radius,
          onTap: onTap,
          borderWidth: borderWidth,
          borderColor: borderColor,
          hasShadow: hasShadow,
        ),

        orElse: () => AppAvatar(
          radius: radius,
          onTap: onTap,
          borderWidth: borderWidth,
          borderColor: borderColor,
          hasShadow: hasShadow,
        ),
      ),
    );
  }
}
