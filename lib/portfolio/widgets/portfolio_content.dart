import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:financial_portfolio/portfolio/widgets/portfolio_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class PortfolioContent extends StatelessWidget {
  const PortfolioContent({required this.portfolio, super.key});

  final Portfolio portfolio;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: AppInsets.md,
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              PortfolioBalanceCard(balance: portfolio.totalBalance),
              const SizedBox(height: AppSpacing.lg),
              Text(
                l10n.performance,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              PortfolioChart(history: portfolio.history),
              const SizedBox(height: AppSpacing.lg),
              Text(
                l10n.assets,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ]),
          ),
        ),
        PortfolioAssetsList(assets: portfolio.assets),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
      ],
    );
  }
}
