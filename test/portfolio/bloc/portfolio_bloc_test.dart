import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/portfolio/portfolio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  group('PortfolioBloc', () {
    late PortfolioRepository portfolioRepository;

    setUp(() {
      portfolioRepository = MockPortfolioRepository();
    });

    test('initial state is PortfolioState.initial', () {
      expect(
        PortfolioBloc(portfolioRepository: portfolioRepository).state,
        equals(const PortfolioState.initial()),
      );
    });

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [loading, loaded] when getPortfolio emits data',
      setUp: () {
        when(() => portfolioRepository.getPortfolio()).thenAnswer(
          (_) => Stream.value(
            const Portfolio(
              totalBalance: 1000,
              assets: [],
              history: [],
            ),
          ),
        );
      },
      build: () => PortfolioBloc(portfolioRepository: portfolioRepository),
      act: (bloc) => bloc.add(const PortfolioEvent.started()),
      expect: () => [
        const PortfolioState.loading(),
        const PortfolioState.loaded(
          Portfolio(totalBalance: 1000, assets: [], history: []),
        ),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [loading, error] when getPortfolio emits error ',
      setUp: () {
        when(() => portfolioRepository.getPortfolio()).thenAnswer(
          (_) => Stream.error(
            const PortfolioGetFailure('oops'),
          ),
        );
      },
      build: () => PortfolioBloc(portfolioRepository: portfolioRepository),
      act: (bloc) => bloc.add(const PortfolioEvent.started()),
      expect: () => [
        const PortfolioState.loading(),
        const PortfolioState.error('oops'),
      ],
    );
  });
}
