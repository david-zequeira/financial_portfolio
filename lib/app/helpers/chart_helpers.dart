import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

/// Helper functions for Chart calculations
class ChartHelpers {
  /// Converts a list of [HistoryPoint] to [FlSpot] for the chart.
  /// Uses actual timestamps as X values for proper date scaling.
  static List<FlSpot> convertToSpots(List<HistoryPoint> history) {
    if (history.isEmpty) return [];

    return history.map((point) {
      // Convert DateTime to seconds since epoch for X value
      final timestampInSeconds = point.timestamp.millisecondsSinceEpoch / 1000;
      return FlSpot(
        timestampInSeconds,
        point.value,
      );
    }).toList();
  }

  /// Calculates the Min Y and Max Y for the chart axis with padding.
  /// Returns a record (minY, maxY).
  static ({double minY, double maxY}) calculateBounds(
    List<HistoryPoint> history,
  ) {
    if (history.isEmpty) return (minY: 0, maxY: 100);

    final values = history.map((e) => e.value).toList();
    final minVal = values.reduce(min);
    final maxVal = values.reduce(max);

    final padding = (maxVal - minVal) * 0.1; // 10% padding

    // Ensure we don't have flat line issues if min == max
    final finalPadding = padding == 0 ? maxVal * 0.1 : padding;

    return (minY: minVal - finalPadding, maxY: maxVal + finalPadding);
  }

  /// Calculates performance percentage from start to end of history.
  /// Returns null if history is empty or has less than 2 points.
  static double? calculatePerformance(List<HistoryPoint> history) {
    if (history.length < 2) return null;

    final firstValue = history.first.value;
    final lastValue = history.last.value;

    return ((lastValue - firstValue) / firstValue) * 100;
  }

  /// Formats a date for the chart X axis labels.
  /// Shows month/day for short timeframes, or just month for longer ones.
  static String formatDateLabel(DateTime date, {bool isCompact = true}) {
    if (isCompact) {
      return DateFormat('MMM d').format(date);
    }
    return DateFormat('MMM d, yyyy').format(date);
  }

  /// Formats a currency value for the chart.
  static String formatCurrency(double value, {bool isCompact = false}) {
    if (isCompact) {
      if (value >= 1000000) {
        return '\$${(value / 1000000).toStringAsFixed(1)}M';
      } else if (value >= 1000) {
        return '\$${(value / 1000).toStringAsFixed(1)}K';
      }
    }
    return NumberFormat.currency(symbol: r'$', decimalDigits: 0).format(value);
  }

  /// Gets intervals for X axis based on number of points.
  /// Returns appropriate spacing to avoid overcrowding labels.
  /// Never returns 0 to avoid assertion errors in fl_chart.
  static double getXAxisInterval(List<HistoryPoint> history) {
    if (history.length < 2) return 1;

    final firstTimestamp =
        history.first.timestamp.millisecondsSinceEpoch / 1000;
    final lastTimestamp = history.last.timestamp.millisecondsSinceEpoch / 1000;
    final range = lastTimestamp - firstTimestamp;

    // Calculate interval to show approximately 5-7 labels
    // Ensure interval is never 0
    final interval = range / 6;
    return interval > 0 ? interval : 1;
  }

  /// Returns the last N points from history for the sliding window effect
  static List<HistoryPoint> getVisibleHistory(
    List<HistoryPoint> history,
    int maxPoints,
  ) {
    return history.length > maxPoints
        ? history.sublist(history.length - maxPoints)
        : history;
  }
}

/// Chart configuration constants
class ChartConstants {
  const ChartConstants._();

  static const int maxVisiblePoints = 30;
  static const double chartHeight = 280;
  static const double lineWidth = 3;
  static const double gridAlpha = 0.1;
  static const double borderAlpha = 0.2;
  static const double areaAlpha = 0.1;
  static const int gridDivisions = 4;
}

/// Data class to hold chart color configuration
class ChartColors {
  const ChartColors({
    required this.lineColor,
    required this.areaColor,
    required this.dotStrokeColor,
  });

  /// Creates colors based on performance (gain/loss)
  factory ChartColors.fromPerformance(
    double? performance,
    Color dotStrokeColor,
  ) {
    final isPositive = performance != null && performance >= 0;
    final lineColor = isPositive ? Colors.green : Colors.red;

    return ChartColors(
      lineColor: lineColor,
      areaColor: lineColor.withValues(alpha: ChartConstants.areaAlpha),
      dotStrokeColor: dotStrokeColor,
    );
  }

  final Color lineColor;
  final Color areaColor;
  final Color dotStrokeColor;
}
