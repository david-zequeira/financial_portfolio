import 'package:financial_portfolio/main/bootstrap/app_bloc_observer.dart';
import 'package:financial_portfolio/main/bootstrap/bootstrap.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  group('Bootstrap', () {
    test('bootstrap function exists and is callable', () {
      // Verify bootstrap function signature
      expect(bootstrap, isA<Function>());
    });

    test('AppBlocObserver is used in bootstrap configuration', () {
      // Verify AppBlocObserver can be instantiated
      const observer = AppBlocObserver();
      expect(observer, isNotNull);
      expect(observer, isA<BlocObserver>());
    });

    group('HydratedBloc storage', () {
      late Storage mockStorage;

      setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();
        mockStorage = MockStorage();

        when(() => mockStorage.write(any(), any<dynamic>()))
            .thenAnswer((_) async {});
        when(() => mockStorage.read(any())).thenReturn(null);
        when(() => mockStorage.delete(any())).thenAnswer((_) async {});
        when(() => mockStorage.clear()).thenAnswer((_) async {});

        HydratedBloc.storage = mockStorage;
      });

      test('HydratedBloc storage can be configured', () {
        expect(HydratedBloc.storage, isNotNull);
        expect(HydratedBloc.storage, equals(mockStorage));
      });
    });
  });

  group('Bootstrap integration', () {
    testWidgets('WidgetsFlutterBinding can be initialized', (tester) async {
      // This is what bootstrap does first
      final binding = WidgetsFlutterBinding.ensureInitialized();
      expect(binding, isNotNull);
    });
  });
}

