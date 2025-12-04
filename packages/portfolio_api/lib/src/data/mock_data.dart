import 'dart:math';
import 'package:fixnum/fixnum.dart';
import 'package:portfolio_api/src/generated/asset/asset.pb.dart';
import 'package:portfolio_api/src/generated/history/history.pb.dart';

/// Static mock data for the Portfolio API
class MockData {
  /// List of assets in the portfolio
  static final List<Asset> assets = [
    Asset(
      id: '1',
      name: 'Apple Inc.',
      symbol: 'AAPL',
      price: 175.50,
      changePercent: 1.25,
      type: AssetType.ASSET_TYPE_STOCK,
    ),
    Asset(
      id: '2',
      name: 'Vanguard S&P 500',
      symbol: 'VOO',
      price: 410.20,
      changePercent: 0.85,
      type: AssetType.ASSET_TYPE_ETF,
    ),
    Asset(
      id: '3',
      name: 'Bitcoin',
      symbol: 'BTC',
      price: 65000.00,
      changePercent: -2.5,
      type: AssetType.ASSET_TYPE_CRYPTO,
    ),
    Asset(
      id: '4',
      name: 'Tesla',
      symbol: 'TSLA',
      price: 240.00,
      changePercent: 3.1,
      type: AssetType.ASSET_TYPE_STOCK,
    ),
    Asset(
      id: '5',
      name: 'Google',
      symbol: 'GOOGL',
      price: 130.00,
      changePercent: -0.5,
      type: AssetType.ASSET_TYPE_STOCK,
    ),
  ];

  /// Generates mock history points for the chart
  static List<HistoryPoint> generateHistory() {
    final now = DateTime.now();
    final points = <HistoryPoint>[];
    double value = 120000.0;
    final random = Random();

    // Generate 30 days of history
    for (int i = 30; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      
      // Random fluctuation between -1% and +1.5%
      final percentChange = (random.nextDouble() * 0.025) - 0.01;
      value = value * (1 + percentChange);
      
      points.add(HistoryPoint(
        timestamp: Int64(date.millisecondsSinceEpoch ~/ 1000),
        value: value,
      ));
    }
    return points;
  }
}

