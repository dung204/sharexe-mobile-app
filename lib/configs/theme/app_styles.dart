import 'package:flutter/material.dart';
import 'package:sharexe/configs/theme/app_colors.dart';

final class AppStyles {
  AppStyles._();

  static const text = _TextStyles();
  static const button = _ButtonStyles();
  static const input = _InputStyles();
  static const box = _BoxStyles();
}

final class _TextStyles {
  const _TextStyles();

  TextStyle get displayLarge => const TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );

  TextStyle get displayMedium =>
      const TextStyle(fontSize: 45, fontWeight: FontWeight.w400);

  TextStyle get displaySmall =>
      const TextStyle(fontSize: 36, fontWeight: FontWeight.w400);

  TextStyle get headlineLarge =>
      const TextStyle(fontSize: 32, fontWeight: FontWeight.w400);

  TextStyle get headlineMedium =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.w400);

  TextStyle get headlineSmall =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);

  TextStyle get titleLarge =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w400);

  TextStyle get titleMedium => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  TextStyle get titleSmall => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  TextStyle get labelLarge => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  TextStyle get labelMedium => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  TextStyle get labelSmall => const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  TextStyle get bodyLarge => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  TextStyle get bodyMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  TextStyle get bodySmall => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
}

final class _ButtonStyles {
  const _ButtonStyles();

  ButtonStyle _base({
    required Color foregroundColor,
    Color? backgroundColor,
    BorderSide? side,
    TextStyle? textStyle,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor,
      textStyle:
          textStyle ??
          AppStyles.text.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      side: side,
    );
  }

  ButtonStyle get primary => _base(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
  );

  ButtonStyle get danger => _base(
    backgroundColor: AppColors.error,
    foregroundColor: AppColors.onError,
  );

  ButtonStyle get outlined => _base(
    foregroundColor: AppColors.grey900,
    side: const BorderSide(color: AppColors.grey300),
  );

  ButtonStyle get ghost => _base(foregroundColor: AppColors.grey900);

  ButtonStyle get iconPrimary => primary.copyWith(
    padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
    minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
  );

  ButtonStyle get iconDanger => danger.copyWith(
    padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
    minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
  );

  ButtonStyle get iconOutlined => outlined.copyWith(
    padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
    minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
  );

  ButtonStyle get iconGhost => ghost.copyWith(
    padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
    minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
  );
}

final class _InputStyles {
  const _InputStyles();

  InputDecorationTheme get theme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: _outlineBorder(AppColors.grey300),
    enabledBorder: _outlineBorder(AppColors.grey300),
    focusedBorder: _outlineBorder(AppColors.primary, width: 2),
    errorBorder: _outlineBorder(AppColors.error),
    focusedErrorBorder: _outlineBorder(AppColors.error, width: 2),
  );

  OutlineInputBorder _outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  InputDecoration auth({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? prefixText,
    TextStyle? hintStyle,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          hintStyle ??
          AppStyles.text.bodyMedium.copyWith(color: AppColors.grey400),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      prefixStyle: AppStyles.text.bodyMedium.copyWith(color: AppColors.grey900),
    );
  }
}

final class _BoxStyles {
  const _BoxStyles();

  List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: AppColors.grey900.withValues(alpha: 0.05),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  BorderRadius get rounded => BorderRadius.circular(8);
}
