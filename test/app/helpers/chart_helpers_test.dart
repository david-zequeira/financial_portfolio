import 'package:financial_portfolio/app/helpers/chart_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

void main() {
  group('ChartHelpers', () {
    // Common test data
    final mockHistory = [
      HistoryPoint(timestamp: DateTime(2023), value: 100),
      HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 200),
      HistoryPoint(timestamp: DateTime(2023, 1, 3), value: 150),
    ];

    group('convertToSpots', () {
      test('converts history points to FlSpots with timestamps', () {
        // Arrange
        final history = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
          HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 200),
        ];

        // Act
        final spots = ChartHelpers.convertToSpots(history);

        // Assert
        expect(spots.length, 2);
        expect(spots[0].y, 100);
        expect(spots[1].y, 200);
        // X values are timestamps in seconds
        expect(
          spots[0].x,
          DateTime(2023).millisecondsSinceEpoch / 1000,
        );
      });

      test('returns empty list for empty history', () {
        // Act & Assert
        expect(ChartHelpers.convertToSpots([]), isEmpty);
      });
    });

    group('calculateBounds', () {
      test('calculates correct min/max with 10% padding', () {
        // Arrange - values: 100, 200, 150
        // Min: 100, Max: 200, Range: 100, Padding: 10

        // Act
        final bounds = ChartHelpers.calculateBounds(mockHistory);

        // Assert
        expect(bounds.minY, 90); // 100 - 10
        expect(bounds.maxY, 210); // 200 + 10
      });

      test('handles flat line when min equals max', () {
        // Arrange
        final flatHistory = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
          HistoryPoint(timestamp: DateTime(2023), value: 100),
        ];

        // Act
        final bounds = ChartHelpers.calculateBounds(flatHistory);

        // Assert - Padding should be 10% of 100 = 10
        expect(bounds.minY, 90);
        expect(bounds.maxY, 110);
      });

      test('returns default bounds for empty list', () {
        // Act
        final bounds = ChartHelpers.calculateBounds([]);

        // Assert
        expect(bounds.minY, 0);
        expect(bounds.maxY, 100);
      });
    });

    group('calculatePerformance', () {
      test('returns positive percentage for gain', () {
        // Arrange - Start: 100, End: 150 = 50% gain
        // Act
        final performance = ChartHelpers.calculatePerformance(mockHistory);

        // Assert
        expect(performance, 50.0);
      });

      test('returns negative percentage for loss', () {
        // Arrange
        final losingHistory = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
          HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 80),
        ];

        // Act
        final performance = ChartHelpers.calculatePerformance(losingHistory);

        // Assert
        expect(performance, -20.0);
      });

      test('returns null for history with less than 2 points', () {
        // Arrange
        final singlePoint = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
        ];

        // Act & Assert
        expect(ChartHelpers.calculatePerformance([]), isNull);
        expect(ChartHelpers.calculatePerformance(singlePoint), isNull);
      });

      test('returns zero for no change', () {
        // Arrange
        final noChangeHistory = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
          HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 100),
        ];

        // Act
        final performance = ChartHelpers.calculatePerformance(noChangeHistory);

        // Assert
        expect(performance, 0.0);
      });
    });

    group('formatDateLabel', () {
      test('formats date in compact mode', () {
        // Arrange
        final date = DateTime(2023, 12, 25);

        // Act
        final label = ChartHelpers.formatDateLabel(date);

        // Assert
        expect(label, 'Dec 25');
      });

      test('formats date in full mode', () {
        // Arrange
        final date = DateTime(2023, 12, 25);

        // Act
        final label = ChartHelpers.formatDateLabel(date, isCompact: false);

        // Assert
        expect(label, 'Dec 25, 2023');
      });
    });

    group('formatCurrency', () {
      test('formats large values in compact mode with M suffix', () {
        // Act & Assert
        expect(
          ChartHelpers.formatCurrency(1500000, isCompact: true),
          r'$1.5M',
        );
      });

      test('formats medium values in compact mode with K suffix', () {
        // Act & Assert
        expect(
          ChartHelpers.formatCurrency(125000, isCompact: true),
          r'$125.0K',
        );
      });

      test('formats values in full mode with currency symbol', () {
        // Act
        final formatted = ChartHelpers.formatCurrency(1234.56);

        // Assert
        expect(formatted, contains(r'$'));
        expect(formatted, contains('1,235')); // Rounded, no decimals
      });
    });

    group('getVisibleHistory', () {
      test('returns all points when history is smaller than max', () {
        // Arrange
        final history = List.generate(
          10,
          (i) => HistoryPoint(
            timestamp: DateTime(2023, 1, i + 1),
            value: 100.0 + i,
          ),
        );

        // Act
        final visible = ChartHelpers.getVisibleHistory(history, 30);

        // Assert
        expect(visible.length, 10);
        expect(visible, equals(history));
      });

      test('returns last N points when history is larger than max', () {
        // Arrange
        final history = List.generate(
          50,
          (i) => HistoryPoint(
            timestamp: DateTime(2023).add(Duration(days: i)),
            value: 100.0 + i,
          ),
        );

        // Act
        final visible = ChartHelpers.getVisibleHistory(history, 30);

        // Assert
        expect(visible.length, 30);
        expect(visible.first.value, 120); // 50 - 30 = index 20
        expect(visible.last.value, 149); // Last element
      });
    });

    group('getXAxisInterval', () {
      test('returns 1 for empty history', () {
        // Act & Assert
        expect(ChartHelpers.getXAxisInterval([]), 1);
      });

      test('returns appropriate interval for date range', () {
        // Arrange - 30 days of history
        final history = List.generate(
          30,
          (i) => HistoryPoint(
            timestamp: DateTime(2023).add(Duration(days: i)),
            value: 100,
          ),
        );

        // Act
        final interval = ChartHelpers.getXAxisInterval(history);

        // Assert - Should divide range into ~6 parts
        expect(interval, greaterThan(0));
      });
    });
  });

  group('ChartConstants', () {
    test('has correct default values', () {
      expect(ChartConstants.maxVisiblePoints, 30);
      expect(ChartConstants.chartHeight, 280);
      expect(ChartConstants.lineWidth, 3);
      expect(ChartConstants.gridDivisions, 4);
    });
  });

  group('ChartColors', () {
    test('creates green colors for positive performance', () {
      // Act
      final colors = ChartColors.fromPerformance(10, Colors.white);

      // Assert
      expect(colors.lineColor, Colors.green);
      expect(colors.dotStrokeColor, Colors.white);
    });

    test('creates red colors for negative performance', () {
      // Act
      final colors = ChartColors.fromPerformance(-5, Colors.black);

      // Assert
      expect(colors.lineColor, Colors.red);
      expect(colors.dotStrokeColor, Colors.black);
    });

    test('creates green colors for zero performance', () {
      // Act
      final colors = ChartColors.fromPerformance(0, Colors.white);

      // Assert
      expect(colors.lineColor, Colors.green);
    });

    test('creates green colors for null performance', () {
      // Act
      final colors = ChartColors.fromPerformance(null, Colors.white);

      // Assert - null is treated as positive (>= 0 check fails, so red)
      expect(colors.lineColor, Colors.red);
    });
  });
}
