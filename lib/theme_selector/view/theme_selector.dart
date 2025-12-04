import 'package:financial_portfolio/l10n/l10n.dart';
import 'package:financial_portfolio/theme_selector/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A drop down menu to select a new [ThemeMode]
///
/// Requires a [ThemeModeBloc] to be provided in the widget tree
/// (usually above [MaterialApp])
class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeModeBloc>().state;
    final l10n = context.l10n;

    return DropdownButton<ThemeMode>(
      key: const Key('themeSelector_dropdown'),
      value: themeMode,
      onChanged: (ThemeMode? selectedThemeMode) {
        if (selectedThemeMode != null) {
          context.read<ThemeModeBloc>().add(
            ThemeModeChanged(selectedThemeMode),
          );
        }
      },
      items: [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text(
            l10n.themeSystem,
            key: const Key('themeSelector_system_dropdownMenuItem'),
          ),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text(
            l10n.themeLight,
            key: const Key('themeSelector_light_dropdownMenuItem'),
          ),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text(
            l10n.themeDark,
            key: const Key('themeSelector_dark_dropdownMenuItem'),
          ),
        ),
      ],
    );
  }
}
