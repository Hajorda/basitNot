import 'package:basitnot/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  
  //Initial Theme
  ThemeData _td = lightMode;

  ThemeData get themeData => _td;

  bool get isDarkMode => _td.brightness == Brightness.dark;
  
  setTheme(ThemeData theme) {
    _td = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _td = _td.brightness == Brightness.dark ? lightMode : darkMode;
    notifyListeners();
  }
}