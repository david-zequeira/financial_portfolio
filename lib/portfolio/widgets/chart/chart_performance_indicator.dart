import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template chart_performance_indicator}
/// Performance indicator badge showing gain/loss percentage.
/// {@endtemplate}
class ChartPerformanceIndicator extends StatelessWidget {
  /// {@macro chart_performance_indicator}
  const ChartPerformanceIndicator({required this.performance, super.key});

  /// Performance percentage value
  final double performance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isPositive = performance >= 0;
    final color = isPositive ? Colors.green : Colors.red;
    final percentText = performance.abs().toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.trending_up : Icons.trending_down,
            color: color,
            size: 16,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            isPositive
                ? l10n.performanceGain(percentText)
                : l10n.performanceLoss(percentText),
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
