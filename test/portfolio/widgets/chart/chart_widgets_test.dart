import 'package:financial_portfolio/portfolio/widgets/chart/chart_performance_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('ChartPerformanceIndicator', () {
    testWidgets(
      'displays positive gain with green color and trending up icon',
      (tester) async {
        // Arrange
        const performance = 15.5;

        // Act
        await tester.pumpWidget(
          buildTestableWidget(
            const ChartPerformanceIndicator(performance: performance),
          ),
        );
        await tester.pumpAndSettle();

        // Assert
        expect(find.byIcon(Icons.trending_up), findsOneWidget);
        expect(find.textContaining('15.50'), findsOneWidget);
        expect(find.textContaining('gain'), findsOneWidget);

        // Verify green color
        final icon = tester.widget<Icon>(find.byIcon(Icons.trending_up));
        expect(icon.color, Colors.green);
      },
    );

    testWidgets(
      'displays negative loss with red color and trending down icon',
      (tester) async {
        // Arrange
        const performance = -8.25;

        // Act
        await tester.pumpWidget(
          buildTestableWidget(
            const ChartPerformanceIndicator(performance: performance),
          ),
        );
        await tester.pumpAndSettle();

        // Assert
        expect(find.byIcon(Icons.trending_down), findsOneWidget);
        expect(find.textContaining('8.25'), findsOneWidget);
        expect(find.textContaining('loss'), findsOneWidget);

        // Verify red color
        final icon = tester.widget<Icon>(find.byIcon(Icons.trending_down));
        expect(icon.color, Colors.red);
      },
    );

    testWidgets('displays zero performance as gain', (tester) async {
      // Arrange
      const performance = 0.0;

      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          const ChartPerformanceIndicator(performance: performance),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.trending_up), findsOneWidget);
      expect(find.textContaining('0.00'), findsOneWidget);
    });

    testWidgets('has correct container decoration', (tester) async {
      // Act
      await tester.pumpWidget(
        buildTestableWidget(
          const ChartPerformanceIndicator(performance: 10),
        ),
      );

      // Assert
      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(container.decoration, isA<BoxDecoration>());
    });
  });
}
