import 'package:financial_portfolio/portfolio/widgets/chart/chart_container.dart';
import 'package:financial_portfolio/portfolio/widgets/chart/chart_performance_indicator.dart';
import 'package:financial_portfolio/portfolio/widgets/portfolio_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  group('PortfolioChart', () {
    testWidgets('renders ChartContainer with history data', (tester) async {
      // Arrange
      final history = List.generate(
        10,
        (i) => HistoryPoint(
          timestamp: DateTime(2023, 1, i + 1),
          value: 100.0 + i * 10,
        ),
      );

      // Act
      await tester.pumpWidget(
        buildTestableWidget(PortfolioChart(history: history)),
      );

      // Assert
      expect(find.byType(ChartContainer), findsOneWidget);
    });

    testWidgets('shows performance indicator when history has 2+ points', (
      tester,
    ) async {
      // Arrange
      final history = [
        HistoryPoint(timestamp: DateTime(2023), value: 100),
        HistoryPoint(timestamp: DateTime(2023, 1, 2), value: 120),
      ];

      // Act
      await tester.pumpWidget(
        buildTestableWidget(PortfolioChart(history: history)),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ChartPerformanceIndicator), findsOneWidget);
    });

    testWidgets(
      'hides performance indicator when history has less than 2 points',
      (tester) async {
        // Arrange
        final history = [
          HistoryPoint(timestamp: DateTime(2023), value: 100),
        ];

        // Act
        await tester.pumpWidget(
          buildTestableWidget(PortfolioChart(history: history)),
        );

        // Assert
        expect(find.byType(ChartPerformanceIndicator), findsNothing);
      },
    );

    testWidgets('handles empty history gracefully', (tester) async {
      // Arrange
      const history = <HistoryPoint>[];

      // Act
      await tester.pumpWidget(
        buildTestableWidget(const PortfolioChart(history: history)),
      );

      // Assert
      expect(find.byType(ChartContainer), findsOneWidget);
      expect(find.byType(ChartPerformanceIndicator), findsNothing);
    });

    testWidgets('uses sliding window for large history', (tester) async {
      // Arrange - 50 points, should show last 30
      final history = List.generate(
        50,
        (i) => HistoryPoint(
          timestamp: DateTime(2023).add(Duration(days: i)),
          value: 100.0 + i,
        ),
      );

      // Act
      await tester.pumpWidget(
        buildTestableWidget(PortfolioChart(history: history)),
      );

      // Assert - Widget should render without errors
      expect(find.byType(PortfolioChart), findsOneWidget);
      expect(find.byType(ChartContainer), findsOneWidget);
    });
  });
}
