import 'dart:async';
import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:portfolio_api/src/data/mock_data.dart';
import 'package:portfolio_api/src/generated/asset/asset.pb.dart';
import 'package:portfolio_api/src/generated/history/history.pb.dart';
import 'package:portfolio_api/src/generated/portfolio/portfolio.pb.dart';

/// {@template portfolio_api_client}
/// A client to fetch portfolio data using Proto models.
///
/// This client simulates a real-time connection using Dart Streams.
/// {@endtemplate}
class PortfolioApiClient {
  /// {@macro portfolio_api_client}
  PortfolioApiClient({
    this.updateInterval = const Duration(seconds: 10),
    this.initialDelay = const Duration(seconds: 1),
  });

  /// The interval between portfolio updates.
  final Duration updateInterval;

  /// The initial simulated network delay.
  final Duration initialDelay;

  final _random = Random();

  /// Fetches the portfolio data stream with simulated real-time updates.
  Stream<PortfolioResponse> getPortfolio() async* {
    // Simulate network delay for the first connection
    await Future<void>.delayed(initialDelay);

    // Initial State: Deep copy to ensure we don't mutate static mock data
    var currentAssets = List<Asset>.generate(
      MockData.assets.length,
      (index) => MockData.assets[index].deepCopy(),
    );

    var currentBalance = 125430.50;
    // History starts with 30 days of historical data
    final history = MockData.generateHistory();

    // Emit initial state
    yield PortfolioResponse(
      totalBalance: currentBalance,
      assets: currentAssets,
      history: history,
    );

    // Stream loop - simulates live market updates
    while (true) {
      await Future<void>.delayed(updateInterval);

      // Simulate market movements
      currentAssets = _simulateMarketMovement(currentAssets);
      currentBalance = _calculateNewBalance(currentBalance);

      // Add new history point with current balance
      _addHistoryPoint(history, currentBalance);

      yield PortfolioResponse(
        totalBalance: currentBalance,
        assets: currentAssets,
        history: history,
      );
    }
  }

  /// Simulates random price fluctuations for assets.
  List<Asset> _simulateMarketMovement(List<Asset> assets) {
    return assets.map((asset) {
      // Random change between -0.5% and +0.5%
      final change = (_random.nextDouble() * 0.01) - 0.005;

      // Update price
      final newPrice = asset.price * (1 + change);

      // Update change percent (accumulated)
      final newChangePercent = asset.changePercent + (change * 100);

      // Return updated asset (Protobuf objects are mutable in Dart)
      return asset
        ..price = newPrice
        ..changePercent = newChangePercent;
    }).toList();
  }

  /// Simulates total balance fluctuation based on market trend.
  double _calculateNewBalance(double currentBalance) {
    // Simplified calculation: market trend +/- 0.1%
    final marketTrend = (_random.nextDouble() * 0.002) - 0.001;
    return currentBalance * (1 + marketTrend);
  }

  /// Adds a new history point and maintains a sliding window of recent data.
  /// Keeps last 60 points to avoid infinite growth.
  void _addHistoryPoint(List<HistoryPoint> history, double currentBalance) {
    final now = DateTime.now();
    final newPoint = HistoryPoint(
      timestamp: Int64(now.millisecondsSinceEpoch ~/ 1000),
      value: currentBalance,
    );

    history.add(newPoint);

    // Keep only the last 60 points (sliding window)
    // This ensures chart performance and shows relevant recent history
    if (history.length > 60) {
      history.removeAt(0);
    }
  }
}
