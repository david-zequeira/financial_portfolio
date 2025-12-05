import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:financial_portfolio/portfolio/widgets/chart/chart_date_label.dart';
import 'package:financial_portfolio/portfolio/widgets/chart/chart_value_label.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

/// {@template chart_container}
/// Container for the line chart with all configurations.
/// {@endtemplate}
class ChartContainer extends StatelessWidget {
  /// {@macro chart_container}
  const ChartContainer({
    required this.visibleHistory,
    required this.performance,
    super.key,
  });

  /// Visible history points to display
  final List<HistoryPoint> visibleHistory;

  /// Performance percentage (optional)
  final double? performance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chartColors = ChartColors.fromPerformance(
      performance,
      theme.scaffoldBackgroundColor,
    );

    final bounds = ChartHelpers.calculateBounds(visibleHistory);
    final spots = ChartHelpers.convertToSpots(visibleHistory);
    final xInterval = ChartHelpers.getXAxisInterval(visibleHistory);

    return Container(
      height: ChartConstants.chartHeight,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: LineChart(
        LineChartData(
          gridData: _buildGridData(theme, bounds),
          titlesData: _buildTitlesData(theme, bounds, xInterval),
          borderData: _buildBorderData(theme),
          minY: bounds.minY,
          maxY: bounds.maxY,
          lineTouchData: _buildTouchData(theme, chartColors),
          lineBarsData: [
            _buildLineBarData(spots, chartColors),
          ],
        ),
      ),
    );
  }

  /// Calculates Y axis interval, ensuring it's never 0
  double _getYInterval(({double minY, double maxY}) bounds) {
    final interval =
        (bounds.maxY - bounds.minY) / ChartConstants.gridDivisions;
    return interval > 0 ? interval : 1;
  }

  /// Builds grid configuration for the chart
  FlGridData _buildGridData(
    ThemeData theme,
    ({double minY, double maxY}) bounds,
  ) {
    return FlGridData(
      drawVerticalLine: false,
      horizontalInterval: _getYInterval(bounds),
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: theme.dividerColor.withValues(
            alpha: ChartConstants.gridAlpha,
          ),
          strokeWidth: 1,
        );
      },
    );
  }

  /// Builds titles (axis labels) configuration
  FlTitlesData _buildTitlesData(
    ThemeData theme,
    ({double minY, double maxY}) bounds,
    double xInterval,
  ) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          interval: xInterval,
          getTitlesWidget: (value, meta) => ChartDateLabel(
            timestamp: value,
            theme: theme,
          ),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 50,
          interval: _getYInterval(bounds),
          getTitlesWidget: (value, meta) => ChartValueLabel(
            value: value,
            theme: theme,
          ),
        ),
      ),
      topTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
    );
  }

  /// Builds border configuration
  FlBorderData _buildBorderData(ThemeData theme) {
    return FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
          color: theme.dividerColor.withValues(
            alpha: ChartConstants.borderAlpha,
          ),
        ),
        left: BorderSide(
          color: theme.dividerColor.withValues(
            alpha: ChartConstants.borderAlpha,
          ),
        ),
      ),
    );
  }

  /// Builds touch interaction (tooltip) configuration
  LineTouchData _buildTouchData(ThemeData theme, ChartColors colors) {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => theme.cardColor,
        tooltipPadding: const EdgeInsets.all(AppSpacing.sm),
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((spot) {
            final date = DateTime.fromMillisecondsSinceEpoch(
              spot.x.toInt() * 1000,
            );
            return LineTooltipItem(
              '${ChartHelpers.formatCurrency(spot.y)}\n',
              theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.lineColor,
              ),
              children: [
                TextSpan(
                  text: ChartHelpers.formatDateLabel(date, isCompact: false),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(
                      alpha: 0.7,
                    ),
                  ),
                ),
              ],
            );
          }).toList();
        },
      ),
    );
  }

  /// Builds the line bar data with styling
  LineChartBarData _buildLineBarData(
    List<FlSpot> spots,
    ChartColors colors,
  ) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: colors.lineColor,
      barWidth: ChartConstants.lineWidth,
      isStrokeCapRound: true,
      dotData: FlDotData(
        getDotPainter: (spot, percent, barData, index) {
          // Only show dot on last point
          if (index == spots.length - 1) {
            return FlDotCirclePainter(
              radius: 5,
              color: colors.lineColor,
              strokeWidth: 2,
              strokeColor: colors.dotStrokeColor,
            );
          }
          return FlDotCirclePainter(
            radius: 0,
            color: Colors.transparent,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        color: colors.areaColor,
      ),
    );
  }
}
