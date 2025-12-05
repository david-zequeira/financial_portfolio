import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:portfolio_api/src/generated/asset/asset.pb.dart';
import 'package:portfolio_api/src/generated/history/history.pb.dart';

/// {@template market_simulation_helper}
/// Helper class that provides market simulation utilities.
///
/// This class encapsulates all the logic related to simulating
/// real-time market movements for testing and demo purposes.
/// {@endtemplate}
class MarketSimulationHelper {
  /// {@macro market_simulation_helper}
  MarketSimulationHelper({Random? random}) : _random = random ?? Random();

  final Random _random;

  /// Maximum number of history points to keep in the sliding window.
  static const int maxHistoryPoints = 60;

  /// Price change range: -0.5% to +0.5%
  static const double priceChangeRange = 0.01;

  /// Balance change range: -0.1% to +0.1%
  static const double balanceChangeRange = 0.002;

  /// Simulates random price fluctuations for a list of assets.
  ///
  /// Each asset price will change randomly between -0.5% and +0.5%.
  /// The change percent is accumulated to show daily performance.
  List<Asset> simulateMarketMovement(List<Asset> assets) {
    return assets.map((asset) {
      final change =
          (_random.nextDouble() * priceChangeRange) - (priceChangeRange / 2);

      final newPrice = asset.price * (1 + change);
      final newChangePercent = asset.changePercent + (change * 100);

      return asset
        ..price = newPrice
        ..changePercent = newChangePercent;
    }).toList();
  }

  /// Simulates total balance fluctuation based on market trend.
  ///
  /// The balance changes randomly between -0.1% and +0.1%.
  double calculateNewBalance(double currentBalance) {
    final marketTrend =
        (_random.nextDouble() * balanceChangeRange) - (balanceChangeRange / 2);
    return currentBalance * (1 + marketTrend);
  }

  /// Adds a new history point and maintains a sliding window of recent data.
  ///
  /// Keeps last [maxHistoryPoints] points to avoid infinite growth
  /// and ensure chart performance.
  void addHistoryPoint(List<HistoryPoint> history, double currentBalance) {
    final now = DateTime.now();
    final newPoint = HistoryPoint(
      timestamp: Int64(now.millisecondsSinceEpoch ~/ 1000),
      value: currentBalance,
    );

    history.add(newPoint);

    if (history.length > maxHistoryPoints) {
      history.removeAt(0);
    }
  }
}
