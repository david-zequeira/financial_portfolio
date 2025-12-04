// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:portfolio_api/portfolio_api.dart';
import 'package:portfolio_api/src/portfolio_api.dart';
import 'package:test/test.dart';

void main() {
  group('PortfolioApi', () {
    test('can be instantiated', () {
      expect(PortfolioApi(), isNotNull);
    });
  });
}
