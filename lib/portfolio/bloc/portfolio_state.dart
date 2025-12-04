part of 'portfolio_bloc.dart';

@freezed
sealed class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = PortfolioInitial;
  const factory PortfolioState.loading() = PortfolioLoading;
  const factory PortfolioState.loaded(Portfolio portfolio) = PortfolioLoaded;
  const factory PortfolioState.error(String message) = PortfolioError;
}
