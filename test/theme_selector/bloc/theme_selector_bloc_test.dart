import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/theme_selector/theme_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mock_hydrated_storage.dart';

void main() {
  group('ThemeModeBloc', () {
    group('initial state', () {
      test('is ThemeMode.system when no persisted state', () {
        // Arrange
        initMockHydratedStorage();

        // Act
        final bloc = ThemeModeBloc();

        // Assert
        expect(bloc.state, ThemeMode.system);
      });
    });

    group('ThemeModeChanged event', () {
      blocTest<ThemeModeBloc, ThemeMode>(
        'emits ThemeMode.dark when dark theme is selected',
        setUp: initMockHydratedStorage,
        build: ThemeModeBloc.new,
        act: (bloc) => bloc.add(const ThemeModeChanged(ThemeMode.dark)),
        expect: () => [ThemeMode.dark],
      );

      blocTest<ThemeModeBloc, ThemeMode>(
        'emits ThemeMode.light when light theme is selected',
        setUp: initMockHydratedStorage,
        build: ThemeModeBloc.new,
        act: (bloc) => bloc.add(const ThemeModeChanged(ThemeMode.light)),
        expect: () => [ThemeMode.light],
      );

      blocTest<ThemeModeBloc, ThemeMode>(
        'emits ThemeMode.system when system theme is selected',
        setUp: initMockHydratedStorage,
        build: ThemeModeBloc.new,
        seed: () => ThemeMode.dark,
        act: (bloc) => bloc.add(const ThemeModeChanged(ThemeMode.system)),
        expect: () => [ThemeMode.system],
      );

      blocTest<ThemeModeBloc, ThemeMode>(
        'keeps current state when null is passed',
        setUp: initMockHydratedStorage,
        build: ThemeModeBloc.new,
        seed: () => ThemeMode.dark,
        act: (bloc) => bloc.add(const ThemeModeChanged(null)),
        expect: () => <ThemeMode>[],
      );
    });

    group('persistence (HydratedBloc)', () {
      test('toJson serializes ThemeMode.system correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final json = bloc.toJson(ThemeMode.system);

        // Assert
        expect(json, {'theme_mode': ThemeMode.system.index});
        expect(json['theme_mode'], 0);
      });

      test('toJson serializes ThemeMode.light correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final json = bloc.toJson(ThemeMode.light);

        // Assert
        expect(json, {'theme_mode': ThemeMode.light.index});
        expect(json['theme_mode'], 1);
      });

      test('toJson serializes ThemeMode.dark correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final json = bloc.toJson(ThemeMode.dark);

        // Assert
        expect(json, {'theme_mode': ThemeMode.dark.index});
        expect(json['theme_mode'], 2);
      });

      test('fromJson deserializes ThemeMode.system correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final themeMode = bloc.fromJson({'theme_mode': 0});

        // Assert
        expect(themeMode, ThemeMode.system);
      });

      test('fromJson deserializes ThemeMode.light correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final themeMode = bloc.fromJson({'theme_mode': 1});

        // Assert
        expect(themeMode, ThemeMode.light);
      });

      test('fromJson deserializes ThemeMode.dark correctly', () {
        // Arrange
        initMockHydratedStorage();
        final bloc = ThemeModeBloc();

        // Act
        final themeMode = bloc.fromJson({'theme_mode': 2});

        // Assert
        expect(themeMode, ThemeMode.dark);
      });

      test('restores persisted ThemeMode.dark from storage', () {
        // Arrange - Simulates the storage of a dark theme
        initMockHydratedStorageWithValue({'theme_mode': 2});

        // Act
        final bloc = ThemeModeBloc();

        // Assert - The bloc should restore the persisted state
        expect(bloc.state, ThemeMode.dark);
      });

      test('restores persisted ThemeMode.light from storage', () {
        // Arrange
        initMockHydratedStorageWithValue({'theme_mode': 1});

        // Act
        final bloc = ThemeModeBloc();

        // Assert
        expect(bloc.state, ThemeMode.light);
      });

      test('persists state when theme changes', () {
        // Arrange
        initMockHydratedStorage();
        ThemeModeBloc().add(const ThemeModeChanged(ThemeMode.dark));
        verify(
          () => hydratedStorage.write(any(), any<dynamic>()),
        ).called(greaterThan(0));
      });
    });

    group('edge cases', () {
      blocTest<ThemeModeBloc, ThemeMode>(
        'handles multiple rapid theme changes correctly',
        setUp: initMockHydratedStorage,
        build: ThemeModeBloc.new,
        act: (bloc) {
          bloc
            ..add(const ThemeModeChanged(ThemeMode.dark))
            ..add(const ThemeModeChanged(ThemeMode.light))
            ..add(const ThemeModeChanged(ThemeMode.system));
        },
        expect: () => [
          ThemeMode.dark,
          ThemeMode.light,
          ThemeMode.system,
        ],
      );
    });
  });

  group('ThemeModeChanged', () {
    test('supports value equality', () {
      // Arrange & Act
      const event1 = ThemeModeChanged(ThemeMode.dark);
      const event2 = ThemeModeChanged(ThemeMode.dark);
      const event3 = ThemeModeChanged(ThemeMode.light);

      // Assert
      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });

    test('props contains themeMode', () {
      // Arrange
      const event = ThemeModeChanged(ThemeMode.dark);

      // Assert
      expect(event.props, [ThemeMode.dark]);
    });
  });
}
