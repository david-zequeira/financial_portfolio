import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:financial_portfolio/portfolio/widgets/chart/chart_container.dart';
import 'package:financial_portfolio/portfolio/widgets/chart/chart_performance_indicator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

/// {@template portfolio_chart}
/// Displays a line chart showing portfolio value over time.
/// Shows the last 30 points in a sliding window for better performance.
/// {@endtemplate}
class PortfolioChart extends StatelessWidget {
  /// {@macro portfolio_chart}
  const PortfolioChart({required this.history, super.key});

  /// List of historical portfolio values
  final List<HistoryPoint> history;

  @override
  Widget build(BuildContext context) {
    final visibleHistory = ChartHelpers.getVisibleHistory(
      history,
      ChartConstants.maxVisiblePoints,
    );
    final performance = ChartHelpers.calculatePerformance(visibleHistory);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (performance != null)
          ChartPerformanceIndicator(performance: performance),
        const SizedBox(height: AppSpacing.md),
        ChartContainer(
          visibleHistory: visibleHistory,
          performance: performance,
        ),
      ],
    );
  }
}
