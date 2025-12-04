import 'package:flutter/widgets.dart';

/// Defines the spacing constants used in the UI.
abstract class AppSpacing {
  /// The default unit of spacing (4.0 logical pixels).
  static const double spaceUnit = 4;

  /// xxxs: 2px
  static const double xxxs = 2;

  /// xxs: 4px
  static const double xxs = spaceUnit;

  /// xs: 8px
  static const double xs = spaceUnit * 2;

  /// sm: 12px
  static const double sm = spaceUnit * 3;

  /// md: 16px
  static const double md = spaceUnit * 4;

  /// lg: 20px
  static const double lg = spaceUnit * 5;

  /// xl: 24px
  static const double xl = spaceUnit * 6;

  /// xxl: 32px
  static const double xxl = spaceUnit * 8;

  /// xxxl: 40px
  static const double xxxl = spaceUnit * 10;

  /// 48px
  static const double x48 = 48;
  
  /// 64px
  static const double x64 = 64;
}

/// Defines common edge insets
abstract class AppInsets {
  /// All 16px
  static const EdgeInsets md = EdgeInsets.all(AppSpacing.md);
  
  /// Horizontal 16px
  static const EdgeInsets hMd = EdgeInsets.symmetric(horizontal: AppSpacing.md);
  
  /// Vertical 16px
  static const EdgeInsets vMd = EdgeInsets.symmetric(vertical: AppSpacing.md);

 }




