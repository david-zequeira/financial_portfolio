import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

part 'portfolio_bloc.freezed.dart';
part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({
    required PortfolioRepository portfolioRepository,
  }) : _portfolioRepository = portfolioRepository,
       super(const PortfolioState.initial()) {
    on<_Started>(_onStarted);
  }

  final PortfolioRepository _portfolioRepository;

  Future<void> _onStarted(_Started event, Emitter<PortfolioState> emit) async {
    await _subscribeToPortfolio(emit);
  }

  Future<void> _subscribeToPortfolio(Emitter<PortfolioState> emit) async {
    emit(const PortfolioState.loading());

    await emit.forEach<Portfolio>(
      _portfolioRepository.getPortfolio(),
      onData: PortfolioState.loaded,
      onError: (error, stackTrace) {
        if (error is PortfolioGetFailure) {
          addError(error, stackTrace);
          return PortfolioState.error(error.error.toString());
        }
        addError(error, stackTrace);
        return PortfolioState.error(error.toString());
      },
    );
  }
}
