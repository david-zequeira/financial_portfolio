import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:financial_portfolio/portfolio/view/portfolio_page.dart';
import 'package:financial_portfolio/portfolio/widgets/portfolio_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_repository/portfolio_repository.dart';
import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}
class MockPortfolioBloc extends MockBloc<PortfolioEvent, PortfolioState> implements PortfolioBloc {}

void main() {
  late PortfolioRepository portfolioRepository;
  late PortfolioBloc portfolioBloc;

  setUp(() {
    portfolioRepository = MockPortfolioRepository();
    portfolioBloc = MockPortfolioBloc();
  });

  Widget buildWidget() {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider.value(
        value: portfolioRepository,
        child: BlocProvider.value(
          value: portfolioBloc,
          child: const PortfolioView(),
        ),
      ),
    );
  }

  group('PortfolioPage', () {
    testWidgets('renders loading indicator when state is loading', (tester) async {
      when(() => portfolioBloc.state).thenReturn(const PortfolioState.loading());
      
      await tester.pumpWidget(buildWidget());
      
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error message when state is failure', (tester) async {
      when(() => portfolioBloc.state).thenReturn(const PortfolioState.failure('oops'));
      
      await tester.pumpWidget(buildWidget());
      
      expect(find.text('Error: oops'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('renders content when state is success', (tester) async {
      final portfolio = Portfolio(
        totalBalance: 1000,
        assets: [
          const Asset(
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

      when(() => portfolioBloc.state).thenReturn(PortfolioState.success(portfolio));
      
      await tester.pumpWidget(buildWidget());
      
      expect(find.byType(PortfolioBalanceCard), findsOneWidget);
      expect(find.byType(PortfolioChart), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('AAPL'), findsOneWidget);
    });
  });
}

