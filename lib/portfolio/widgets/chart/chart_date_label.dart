import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:flutter/material.dart';

/// {@template chart_date_label}
/// Widget for displaying date labels on the X axis.
/// {@endtemplate}
class ChartDateLabel extends StatelessWidget {
  /// {@macro chart_date_label}
  const ChartDateLabel({
    required this.timestamp,
    required this.theme,
    super.key,
  });

  /// Timestamp value in seconds since epoch
  final double timestamp;

  /// Theme data for styling
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(
      timestamp.toInt() * 1000,
    );

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Text(
        ChartHelpers.formatDateLabel(date),
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: 10,
          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

