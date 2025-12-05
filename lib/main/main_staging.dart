import 'package:financial_portfolio/app/app.dart';
import 'package:financial_portfolio/main/bootstrap/bootstrap.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

Future<void> main() async {
  final portfolioApiClient = PortfolioApiClient();

  final portfolioRepository = PortfolioRepository(
    portfolioApiClient: portfolioApiClient,
  );

  await bootstrap(
    () => App(portfolioRepository: portfolioRepository),
  );
}
