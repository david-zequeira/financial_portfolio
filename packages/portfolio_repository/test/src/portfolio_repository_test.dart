// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

void main() {
  group('PortfolioRepository', () {
    test('can be instantiated', () {
      expect(PortfolioRepository(portfolioApiClient: PortfolioApiClient()), isNotNull);
    });
  });
}
