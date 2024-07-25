import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themePreferenceKey = "theme_preference";
  SharedPreferences? _preferences;

  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.light)) {
    _loadTheme();
    on<ToggleTheme>((event, emit) {
      final newTheme = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      _saveTheme(newTheme);
      emit(ThemeState(themeMode: newTheme));
    });
  }

  Future<void> _initPrefs() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _loadTheme() async {
    await _initPrefs();
    _preferences?.getBool(_themePreferenceKey) ?? false;
    // final isDarkMode = 
    // emit(ThemeState(themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    await _initPrefs();
    _preferences?.setBool(_themePreferenceKey, themeMode == ThemeMode.dark);
  }
}
