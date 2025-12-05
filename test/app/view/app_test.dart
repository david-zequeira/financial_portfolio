// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:financial_portfolio/app/app.dart';
import 'package:financial_portfolio/portfolio/view/portfolio_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          portfolioRepository: PortfolioRepository(
            portfolioApiClient: PortfolioApiClient(),
          ),
        ),
      );
      expect(find.byType(PortfolioPage), findsOneWidget);
    });
  });
}
