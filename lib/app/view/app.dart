import 'package:app_ui/app_ui.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:financial_portfolio/portfolio/view/portfolio_page.dart';
import 'package:financial_portfolio/theme_selector/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class App extends StatelessWidget {
  const App({
    required PortfolioRepository portfolioRepository,
    super.key,
  }) : _portfolioRepository = portfolioRepository;

  final PortfolioRepository _portfolioRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _portfolioRepository,
      child: BlocProvider(
        create: (_) => ThemeModeBloc(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.retailTheme,
          darkTheme: AppTheme.neobankTheme,
          themeMode: themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const PortfolioPage(),
        );
      },
    );
  }
}
