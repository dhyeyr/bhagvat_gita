import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ThemeProvider extends ChangeNotifier {
  bool currentTheme = false;

  ThemeMode? get thememode {
    if (currentTheme == false) {
      return ThemeMode.light;
    } else if (currentTheme == true) {
      return ThemeMode.dark;
    }
    return null;
  }

  void changeTheme(bool theme) {
    prefs.setBool('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  void getTheme() {
    currentTheme = prefs.getBool('theme') ?? false;
    notifyListeners();
  }
}
