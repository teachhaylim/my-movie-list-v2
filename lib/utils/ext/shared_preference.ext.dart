import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferenceExt on SharedPreferences {
  static final _prefs = getIt<SharedPreferences>();

  ThemeMode get savedTheme {
    final lvSavedTheme = _prefs.getString(AppPreferenceKeys.savedTheme) ?? ThemeMode.system.name;

    switch (lvSavedTheme) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      case "system":
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  set savedTheme(ThemeMode theme) => _prefs.setString(AppPreferenceKeys.savedTheme, theme.name);
}
