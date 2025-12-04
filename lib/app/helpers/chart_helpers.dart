import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

/// Helper functions for Chart calculations
class ChartHelpers {
  /// Converts a list of [HistoryPoint] to [FlSpot] for the chart.
  static List<FlSpot> convertToSpots(List<HistoryPoint> history) {
    return history
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.value))
        .toList();
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
}
