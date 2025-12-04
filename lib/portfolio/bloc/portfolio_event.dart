part of 'portfolio_bloc.dart';

@freezed
class PortfolioEvent with _$PortfolioEvent {
  const factory PortfolioEvent.started() = _Started;
  const factory PortfolioEvent.refreshed() = _Refreshed;
}
