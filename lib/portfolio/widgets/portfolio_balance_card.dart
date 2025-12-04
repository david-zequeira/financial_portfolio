import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PortfolioBalanceCard extends StatelessWidget {
  const PortfolioBalanceCard({
    required this.balance,
    super.key,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: AppInsets.md,
        child: Column(
          children: [
            Text(
              context.l10n.totalBalance,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
