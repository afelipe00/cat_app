import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemePreference { light, dark }

class ThemeProvider with ChangeNotifier {
  ThemePreference _themePreference = ThemePreference.light;

  ThemePreference get themePreference => _themePreference;

  void setThemePreference(ThemePreference preference) async {
    _themePreference = preference;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('catTheme', preference.toString());
    notifyListeners();
  }

  void toggleTheme() async {
    _themePreference = _themePreference == ThemePreference.light ? ThemePreference.dark : ThemePreference.light;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('catTheme', _themePreference.toString());
    setThemePreference(_themePreference);
  }

  void getThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('catTheme') ?? 'ThemePreference.light';
    _themePreference = ThemePreference.values
        .firstWhere((element) => element.toString() == theme, orElse: () => ThemePreference.light);
    notifyListeners();
  }
}
