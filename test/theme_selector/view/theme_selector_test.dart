import 'package:bloc_test/bloc_test.dart';
import 'package:financial_portfolio/theme_selector/theme_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockThemeModeBloc extends MockBloc<ThemeModeEvent, ThemeMode>
    implements ThemeModeBloc {}

void main() {
  late ThemeModeBloc themeModeBloc;

  group('ThemeSelector', () {
    setUp(() {
      themeModeBloc = MockThemeModeBloc();
      when(() => themeModeBloc.state).thenReturn(ThemeMode.system);
    });

    testWidgets('contains all three ThemeMode options', (tester) async {
      await tester.pumpApp(
        BlocProvider<ThemeModeBloc>.value(
          value: themeModeBloc,
          child: const ThemeSelector(),
        ),
      );
      final dropdown = find.byKey(const Key('themeSelector_dropdown'));
      expect(dropdown, findsOneWidget);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('themeSelector_system_dropdownMenuItem')),
        findsWidgets,
      );
      expect(
        find.byKey(const Key('themeSelector_light_dropdownMenuItem')),
        findsWidgets,
      );
      expect(
        find.byKey(const Key('themeSelector_dark_dropdownMenuItem')),
        findsWidgets,
      );
    });

    testWidgets('sets the new ThemeMode on change', (tester) async {
      await tester.pumpApp(
        BlocProvider<ThemeModeBloc>.value(
          value: themeModeBloc,
          child: const ThemeSelector(),
        ),
      );

      await tester.tap(find.byKey(const Key('themeSelector_dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('themeSelector_dark_dropdownMenuItem')).last,
      );
      verify(
        () => themeModeBloc.add(const ThemeModeChanged(ThemeMode.dark)),
      ).called(1);
    });
  });
}
