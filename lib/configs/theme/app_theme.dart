import 'package:flutter/material.dart';
import 'package:sharexe/configs/theme/app_colors.dart';
import 'package:sharexe/configs/theme/app_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        surface: AppColors.background,
        onSurface: AppColors.onBackground,
      ),

      textTheme: _buildTextTheme(
        primary: AppColors.grey900,
        secondary: AppColors.grey700,
        tertiary: AppColors.grey500,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.grey900,
        elevation: 0,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.button.primary,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppStyles.button.outlined,
      ),

      textButtonTheme: TextButtonThemeData(style: AppStyles.button.ghost),

      inputDecorationTheme: AppStyles.input.theme,

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shadowColor: AppColors.grey900.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        surface: AppColors.grey900,
        onSurface: AppColors.grey50,
      ),

      textTheme: _buildTextTheme(
        primary: AppColors.grey50,
        secondary: AppColors.grey200,
        tertiary: AppColors.grey400,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.grey900,
        foregroundColor: AppColors.grey50,
        elevation: 0,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.button.primary,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppStyles.button.outlined.copyWith(
          foregroundColor: const WidgetStatePropertyAll(AppColors.grey50),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.grey600),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: AppStyles.button.ghost.copyWith(
          foregroundColor: const WidgetStatePropertyAll(AppColors.grey50),
        ),
      ),

      inputDecorationTheme: AppStyles.input.theme.copyWith(
        fillColor: AppColors.grey800,
        hintStyle: AppStyles.text.bodyMedium.copyWith(color: AppColors.grey400),
        prefixStyle: AppStyles.text.bodyMedium.copyWith(
          color: AppColors.grey400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.grey700),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.grey800,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.grey700,
        thickness: 1,
      ),
    );
  }

  static TextTheme _buildTextTheme({
    required Color primary,
    required Color secondary,
    required Color tertiary,
  }) {
    return TextTheme(
      displayLarge: AppStyles.text.displayLarge.copyWith(color: primary),
      displayMedium: AppStyles.text.displayMedium.copyWith(color: primary),
      displaySmall: AppStyles.text.displaySmall.copyWith(color: primary),

      headlineLarge: AppStyles.text.headlineLarge.copyWith(color: primary),
      headlineMedium: AppStyles.text.headlineMedium.copyWith(color: primary),
      headlineSmall: AppStyles.text.headlineSmall.copyWith(color: primary),

      titleLarge: AppStyles.text.titleLarge.copyWith(color: primary),
      titleMedium: AppStyles.text.titleMedium.copyWith(color: primary),
      titleSmall: AppStyles.text.titleSmall.copyWith(color: primary),

      bodyLarge: AppStyles.text.bodyLarge.copyWith(color: secondary),
      bodyMedium: AppStyles.text.bodyMedium.copyWith(color: secondary),
      bodySmall: AppStyles.text.bodySmall.copyWith(color: secondary),

      labelLarge: AppStyles.text.labelLarge.copyWith(color: tertiary),
      labelMedium: AppStyles.text.labelMedium.copyWith(color: tertiary),
      labelSmall: AppStyles.text.labelSmall.copyWith(color: tertiary),
    );
  }
}
