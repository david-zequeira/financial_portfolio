import 'package:app_ui/src/colors/app_colors.dart';
import 'package:app_ui/src/layout/app_spacing.dart';
import 'package:app_ui/src/typography/app_typography.dart';
import 'package:flutter/material.dart';

/// Defines the theme data for the application.
class AppTheme {
  /// The "Retail" theme (Light mode, Professional).
  static ThemeData get retailTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.retailPrimary,
      scaffoldBackgroundColor: AppColors.retailBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.retailPrimary,
        secondary: AppColors.retailSecondary,
        error: AppColors.red,
        onSecondary: AppColors.white,
        onSurface: AppColors.retailTextPrimary,
      ),
      textTheme: AppTypography.retailTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.retailSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.retailTextTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.retailTextPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.retailSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.retailPrimary,
          foregroundColor: AppColors.white,
          textStyle: AppTypography.retailTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.sm),
          ),
        ),
      ),
    );
  }

  /// The "Neobank" theme (Dark mode, Neon).
  static ThemeData get neobankTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.neonPrimary,
      scaffoldBackgroundColor: AppColors.neonBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonPrimary,
        secondary: AppColors.neonSecondary,
        surface: AppColors.neonSurface,
        error: AppColors.red, 
        onSecondary: AppColors.white,
        tertiary: AppColors.neonAccent,
      ),
      textTheme: AppTypography.neobankTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.neonBackground,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.neobankTextTheme.headlineSmall?.copyWith(
          color: AppColors.neonPrimary,
          letterSpacing: 2.0,
        ),
        iconTheme: const IconThemeData(color: AppColors.neonPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.neonSurface,
        elevation: 8,
        shadowColor: AppColors.neonPrimary.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          side: BorderSide(
            color: AppColors.neonPrimary.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.neonPrimary,
          foregroundColor: AppColors.black,
          textStyle: AppTypography.neobankTextTheme.labelLarge,
          shadowColor: AppColors.neonPrimary,
          elevation: 5,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.x48), // Pill shape
          ),
        ),
      ),
    );
  }
}

