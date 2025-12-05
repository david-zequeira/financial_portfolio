import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:financial_portfolio/portfolio/portfolio.dart';
import 'package:financial_portfolio/theme_selector/theme_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

Widget buildTestableWidget(Widget child) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

Widget buildMockApp(
  Widget child, {
  required PortfolioRepository portfolioRepository,
  required PortfolioBloc portfolioBloc,
  required ThemeModeBloc themeModeBloc,
}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: RepositoryProvider.value(
      value: portfolioRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PortfolioBloc>.value(value: portfolioBloc),
          BlocProvider<ThemeModeBloc>.value(value: themeModeBloc),
        ],
        child: child,
      ),
    ),
  );
}
