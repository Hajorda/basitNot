import 'package:basitnot/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  
  //Initial Theme
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;
  
  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData.brightness == Brightness.dark ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}