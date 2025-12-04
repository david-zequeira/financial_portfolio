import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:financial_portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:financial_portfolio/portfolio/widgets/portfolio_widgets.dart';
import 'package:financial_portfolio/theme_selector/view/theme_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioBloc(
        portfolioRepository: context.read<PortfolioRepository>(),
      )..add(const PortfolioEvent.started()),
      child: const PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: const [
          ThemeSelector(),
          SizedBox(width: AppSpacing.md),
        ],
      ),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          switch (state) {
            case PortfolioInitial():
              return const SizedBox.shrink();
            case PortfolioLoading():
              {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.retailPrimary,
                  ),
                );
              }
            case PortfolioError(:final message):
              {
                return Center(
                  child: Text(l10n.errorMessage(message)),
                );
              }
            case PortfolioLoaded(:final portfolio):
              {
                return PortfolioContent(portfolio: portfolio);
              }
          }
        },
      ),
    );
  }
}
