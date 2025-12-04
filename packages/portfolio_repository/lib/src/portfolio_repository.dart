import 'package:equatable/equatable.dart';
import 'package:portfolio_api/portfolio_api.dart' as api;
import 'package:portfolio_repository/src/mappers/proto_mappers.dart';
import 'package:portfolio_repository/src/models/models.dart';

/// A base failure for the portfolio repository failures.
abstract class PortfolioFailure with EquatableMixin implements Exception {
  /// {@macro portfolio_repository_exception}
  const PortfolioFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// A failure to fetch the portfolio.
class PortfolioGetFailure extends PortfolioFailure {
  /// {@macro portfolio_fetch_exception}
  const PortfolioGetFailure(super.error);
}

/// {@template portfolio_repository}
/// A repository for the portfolio.
/// {@endtemplate}
class PortfolioRepository {
  /// {@macro portfolio_repository}
  const PortfolioRepository({
    required api.PortfolioApiClient portfolioApiClient,
  }) : _portfolioApiClient = portfolioApiClient;

  final api.PortfolioApiClient _portfolioApiClient;

  /// Returns a stream of portfolio data from the real-time API.
  ///
  /// This stream emits updates whenever the market data changes.
  Stream<Portfolio> getPortfolio() {
    return _portfolioApiClient.getPortfolio().map((response) {
      return response.toDomain();
    });
  }
}
