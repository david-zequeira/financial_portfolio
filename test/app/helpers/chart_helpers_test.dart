import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

void main() {
  group('ChartHelpers', () {
    final mockHistory = [
      HistoryPoint(timestamp: DateTime(2023, 1, 1), value: 100),
      HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 200),
      HistoryPoint(timestamp: DateTime(2023, 1, 3), value: 50),
    ];

    group('convertToSpots', () {
      test('converts history points to FlSpots correctly', () {
        final spots = ChartHelpers.convertToSpots(mockHistory);
        expect(spots.length, 3);
        expect(spots[0], const FlSpot(0, 100));
        expect(spots[1], const FlSpot(1, 200));
        expect(spots[2], const FlSpot(2, 50));
      });

      test('returns empty list for empty history', () {
        expect(ChartHelpers.convertToSpots([]), isEmpty);
      });
    });

    group('calculateBounds', () {
      test('calculates correct min/max with padding', () {
        final bounds = ChartHelpers.calculateBounds(mockHistory);
        // Min: 50, Max: 200. Range: 150. Padding: 15.
        // Expected MinY: 35, MaxY: 215.
        expect(bounds.minY, 35);
        expect(bounds.maxY, 215);
      });

      test('handles flat line (min == max)', () {
        final flatHistory = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
          HistoryPoint(timestamp: DateTime(2023), value: 100),
        ];
        final bounds = ChartHelpers.calculateBounds(flatHistory);
        // Min: 100, Max: 100. Padding should be 10% of 100 = 10.
        expect(bounds.minY, 90);
        expect(bounds.maxY, 110);
      });

      test('returns default for empty list', () {
        final bounds = ChartHelpers.calculateBounds([]);
        expect(bounds.minY, 0);
        expect(bounds.maxY, 100);
      });
    });
  });
}

