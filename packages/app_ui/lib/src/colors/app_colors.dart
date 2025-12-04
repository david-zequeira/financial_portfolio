import 'package:flutter/material.dart';

/// Defines the color palette for the UI.
abstract class AppColors {
  /// Black
  static const Color black = Color(0xFF000000);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  // --- Retail Theme (Light/Blue) ---
  
  /// Primary blue for Retail theme
  static const Color retailPrimary = Color(0xFF0052CC); // Strong Corporate Blue
  
  /// Secondary blue/accent for Retail theme
  static const Color retailSecondary = Color(0xFF2684FF);

  /// Background for Retail theme
  static const Color retailBackground = Color(0xFFF4F5F7); // Light Gray

  /// Surface/Card color for Retail theme
  static const Color retailSurface = Color(0xFFFFFFFF);

  /// Text color for Retail theme
  static const Color retailTextPrimary = Color(0xFF172B4D);
  static const Color retailTextSecondary = Color(0xFF5E6C84);

  // --- Neobank Theme (Dark/Neon) ---

  /// Primary Neon Green
  static const Color neonPrimary = Color(0xFFCCFF00); // Lime Neon
  
  /// Secondary Neon Purple
  static const Color neonSecondary = Color(0xFFBC00FF);

  /// Cyan Accent
  static const Color neonAccent = Color(0xFF00F0FF);

  /// Background for Neobank theme
  static const Color neonBackground = Color(0xFF0A0A0A); // Almost Black
  
  /// Surface/Card color for Neobank theme
  static const Color neonSurface = Color(0xFF1A1A1A);

  /// Text color for Neobank theme
  static const Color neonTextPrimary = Color(0xFFFFFFFF);
  static const Color neonTextSecondary = Color(0xFFB3B3B3);

  // --- Functional Colors ---
  
  /// Success Green
  static const Color green = Color(0xFF36B37E);
  
  /// Error Red
  static const Color red = Color(0xFFFF5630);

  /// Warning Yellow
  static const Color yellow = Color(0xFFFFAB00);
}

