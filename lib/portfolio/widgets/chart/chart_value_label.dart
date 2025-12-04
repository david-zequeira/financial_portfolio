import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:flutter/material.dart';

/// {@template chart_value_label}
/// Widget for displaying value labels on the Y axis.
/// {@endtemplate}
class ChartValueLabel extends StatelessWidget {
  /// {@macro chart_value_label}
  const ChartValueLabel({
    required this.value,
    required this.theme,
    super.key,
  });

  /// Value to display
  final double value;

  /// Theme data for styling
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      ChartHelpers.formatCurrency(value, isCompact: true),
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: 10,
        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
      ),
    );
  }
}
