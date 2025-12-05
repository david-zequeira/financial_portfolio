// Ignore for testing purposes

import 'package:financial_portfolio/app/app.dart';
import 'package:financial_portfolio/portfolio/view/portfolio_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

import '../../helpers/helpers.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  group('App', () {
    late PortfolioRepository portfolioRepository;

    setUp(() {
      initMockHydratedStorage();
      portfolioRepository = MockPortfolioRepository();

      // Mock the portfolio stream to emit a loaded state
      when(() => portfolioRepository.getPortfolio()).thenAnswer(
        (_) => Stream.value(
          const Portfolio(
            totalBalance: 10000,
            assets: [],
            history: [],
          ),
        ),
      );
    });

    testWidgets('renders PortfolioPage', (tester) async {
      await tester.pumpWidget(
        App(portfolioRepository: portfolioRepository),
      );
      await tester.pump();

      expect(find.byType(PortfolioPage), findsOneWidget);
    });
  });
}
