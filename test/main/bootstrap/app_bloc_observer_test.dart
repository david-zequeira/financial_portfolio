import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/main/bootstrap/app_bloc_observer.dart';
import 'package:flutter_test/flutter_test.dart';

// Simple test bloc for testing the observer
class _TestBloc extends Bloc<int, int> {
  _TestBloc() : super(0) {
    on<int>((event, emit) {
      if (event < 0) {
        throw Exception('Negative numbers not allowed');
      }
      emit(state + event);
    });
  }
}

void main() {
  group('AppBlocObserver', () {
    late AppBlocObserver observer;
    late _TestBloc bloc;

    setUp(() {
      observer = const AppBlocObserver();
      bloc = _TestBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('can be instantiated', () {
      expect(const AppBlocObserver(), isNotNull);
    });

    test('is a const constructor', () {
      expect(
        identical(const AppBlocObserver(), const AppBlocObserver()),
        isTrue,
      );
    });

    test('onChange logs the bloc change', () {
      // This test verifies onChange doesn't throw
      expect(
        () => observer.onChange(
          bloc,
          const Change<int>(currentState: 0, nextState: 1),
        ),
        returnsNormally,
      );
    });

    test('onError logs the bloc error', () {
      // This test verifies onError doesn't throw
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      expect(
        () => observer.onError(bloc, error, stackTrace),
        returnsNormally,
      );
    });

    group('integration with bloc', () {
      setUp(() {
        Bloc.observer = observer;
      });

      blocTest<_TestBloc, int>(
        'observer receives onChange when bloc state changes',
        build: _TestBloc.new,
        act: (bloc) => bloc.add(5),
        expect: () => [5],
      );

      blocTest<_TestBloc, int>(
        'observer receives onError when bloc throws',
        build: _TestBloc.new,
        act: (bloc) => bloc.add(-1),
        errors: () => [isA<Exception>()],
      );
    });
  });
}
