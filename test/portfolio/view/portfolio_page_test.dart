import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/portfolio/portfolio.dart';
import 'package:financial_portfolio/theme_selector/theme_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

import '../../helpers/helpers.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

class MockPortfolioBloc extends MockBloc<PortfolioEvent, PortfolioState>
    implements PortfolioBloc {}

class MockThemeModeBloc extends MockBloc<ThemeModeEvent, ThemeMode>
    implements ThemeModeBloc {}

void main() {
  late PortfolioRepository portfolioRepository;
  late PortfolioBloc portfolioBloc;
  late ThemeModeBloc themeModeBloc;

  setUp(() {
    portfolioRepository = MockPortfolioRepository();
    portfolioBloc = MockPortfolioBloc();
    themeModeBloc = MockThemeModeBloc();
    when(() => themeModeBloc.state).thenReturn(ThemeMode.system);
  });

  group('PortfolioPage', () {
    testWidgets('renders loading indicator when state is loading', (
      tester,
    ) async {
      when(
        () => portfolioBloc.state,
      ).thenReturn(const PortfolioState.loading());

      await tester.pumpWidget(
        buildMockApp(
          const PortfolioView(),
          portfolioRepository: portfolioRepository,
          portfolioBloc: portfolioBloc,
          themeModeBloc: themeModeBloc,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error message when state is failure', (tester) async {
      when(
        () => portfolioBloc.state,
      ).thenReturn(const PortfolioState.error('oops'));

      await tester.pumpWidget(
        buildMockApp(
          const PortfolioView(),
          portfolioRepository: portfolioRepository,
          portfolioBloc: portfolioBloc,
          themeModeBloc: themeModeBloc,
        ),
      );

      expect(find.text('Error: oops'), findsOneWidget);
    });

    testWidgets('renders content when state is success', (tester) async {
      const portfolio = Portfolio(
        totalBalance: 1000,
        assets: [
          Asset(
            id: '1',
            name: 'Apple',
            symbol: 'AAPL',
            price: 150,
            changePercent: 1.2,
            type: AssetType.stock,
          ),
        ],
        history: [],
      );

      when(
        () => portfolioBloc.state,
      ).thenReturn(const PortfolioState.loaded(portfolio));

      await tester.pumpWidget(
        buildMockApp(
          const PortfolioView(),
          portfolioRepository: portfolioRepository,
          portfolioBloc: portfolioBloc,
          themeModeBloc: themeModeBloc,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PortfolioContent), findsOneWidget);
      expect(find.byType(PortfolioBalanceCard), findsOneWidget);
      expect(find.byType(PortfolioChart), findsOneWidget);
    });
  });
}
