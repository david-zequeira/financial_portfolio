import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({required this.history, super.key});

  final List<HistoryPoint> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(child: Text(context.l10n.noHistoryData)),
      );
    }

    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    // Delegate logic to helper
    final bounds = ChartHelpers.calculateBounds(history);
    final spots = ChartHelpers.convertToSpots(history);

    return Container(
      height: 250,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minY: bounds.minY,
          maxY: bounds.maxY,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => theme.cardColor,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '\$${spot.y.toStringAsFixed(2)}',
                    theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: primaryColor,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: primaryColor.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
