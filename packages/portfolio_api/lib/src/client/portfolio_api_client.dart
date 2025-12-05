import 'dart:async';

import 'package:portfolio_api/src/data/mock_data.dart';
import 'package:portfolio_api/src/generated/asset/asset.pb.dart';
import 'package:portfolio_api/src/generated/history/history.pb.dart';
import 'package:portfolio_api/src/generated/portfolio/portfolio.pb.dart';
import 'package:portfolio_api/src/helper/market_simulation_helper.dart';

/// {@template portfolio_api_client}
/// A client to fetch portfolio data using Proto models.
///
/// This client simulates a real-time connection using Dart Streams.
/// The actual market simulation logic is delegated to [MarketSimulationHelper].
/// {@endtemplate}
class PortfolioApiClient {
  /// {@macro portfolio_api_client}
  PortfolioApiClient({
    this.updateInterval = const Duration(seconds: 10),
    this.initialDelay = const Duration(seconds: 1),
    MarketSimulationHelper? simulationHelper,
  }) : _simulationHelper = simulationHelper ?? MarketSimulationHelper();

  /// The interval between portfolio updates.
  final Duration updateInterval;

  /// The initial simulated network delay.
  final Duration initialDelay;

  /// Helper for market simulation logic.
  final MarketSimulationHelper _simulationHelper;

  /// Fetches the portfolio data stream with simulated real-time updates.
  ///
  /// Returns a [Stream] of [PortfolioResponse] that emits:
  /// - Initial portfolio state after [initialDelay]
  /// - Updated portfolio every [updateInterval] with simulated market movements
  Stream<PortfolioResponse> getPortfolio() async* {
    await Future<void>.delayed(initialDelay);

    final currentAssets = _createInitialAssets();
    const currentBalance = MockData.initialBalance;
    final history = MockData.generateHistory();

    yield _buildPortfolioResponse(currentAssets, currentBalance, history);

    yield* _streamPortfolioUpdates(currentAssets, currentBalance, history);
  }

  /// Creates a deep copy of initial assets to avoid mutating static mock data.
  List<Asset> _createInitialAssets() {
    return List<Asset>.generate(
      MockData.assets.length,
      (index) => MockData.assets[index].deepCopy(),
    );
  }

  /// Builds a [PortfolioResponse] from current state.
  PortfolioResponse _buildPortfolioResponse(
    List<Asset> assets,
    double balance,
    List<HistoryPoint> history,
  ) {
    return PortfolioResponse(
      totalBalance: balance,
      assets: assets,
      history: history,
    );
  }

  /// Streams continuous portfolio updates with market simulation.
  Stream<PortfolioResponse> _streamPortfolioUpdates(
    List<Asset> currentAssets,
    double currentBalance,
    List<HistoryPoint> history,
  ) async* {
    var assets = currentAssets;
    var balance = currentBalance;

    while (true) {
      await Future<void>.delayed(updateInterval);

      assets = _simulationHelper.simulateMarketMovement(assets);
      balance = _simulationHelper.calculateNewBalance(balance);
      _simulationHelper.addHistoryPoint(history, balance);

      yield _buildPortfolioResponse(assets, balance, history);
    }
  }
}
