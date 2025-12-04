import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

/// Defines the text styles for the application.
class AppTypography {
  /// Retail Theme Text Styles (Clean, Professional)
  static TextTheme get retailTextTheme {
    return GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: AppColors.retailTextPrimary,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColors.retailTextPrimary,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: AppColors.retailTextPrimary,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.retailTextPrimary,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.retailTextPrimary,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.retailTextPrimary,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.retailTextPrimary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.retailTextPrimary,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.retailTextPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.retailTextSecondary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.retailTextSecondary,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.retailTextSecondary,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.retailTextPrimary,
      ),
    );
  }

  /// Neobank Theme Text Styles (Tech, Modern)
  static TextTheme get neobankTextTheme {
    return GoogleFonts.rajdhaniTextTheme().copyWith(
      displayLarge: GoogleFonts.rajdhani(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
        letterSpacing: 1.5,
      ),
      displayMedium: GoogleFonts.rajdhani(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
        letterSpacing: 1.2,
      ),
      displaySmall: GoogleFonts.rajdhani(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
      ),
      headlineLarge: GoogleFonts.rajdhani(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
      ),
      headlineMedium: GoogleFonts.rajdhani(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
      ),
      headlineSmall: GoogleFonts.rajdhani(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
      ),
      titleLarge: GoogleFonts.rajdhani(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.neonTextPrimary,
      ),
      titleMedium: GoogleFonts.rajdhani(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.neonTextPrimary,
      ),
      titleSmall: GoogleFonts.rajdhani(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.neonTextPrimary,
      ),
      bodyLarge: GoogleFonts.rajdhani(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.neonTextSecondary,
      ),
      bodyMedium: GoogleFonts.rajdhani(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.neonTextSecondary,
      ),
      bodySmall: GoogleFonts.rajdhani(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.neonTextSecondary,
      ),
      labelLarge: GoogleFonts.rajdhani(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.neonTextPrimary,
        letterSpacing: 1.0,
      ),
    );
  }
}


