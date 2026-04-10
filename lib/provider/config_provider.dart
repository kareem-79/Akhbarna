import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  double _textScaleFactor = 1.0;

  bool _isSystemFont = true;

  double get textScaleFactor => _textScaleFactor;

  bool get isSystemFont => _isSystemFont;

  void changeAppTheme(ThemeMode newTheme) async {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String get fontSizeLevel {
    if (_isSystemFont) return "تلقائي";
    if (_textScaleFactor <= 0.85) return "صغير";
    if (_textScaleFactor <= 1.0) return "متوسط";
    if (_textScaleFactor <= 1.2) return "كبير";
    return "كبير جدا";
  }

  void changeFontSize(String level) {
    _isSystemFont = false;

    switch (level) {
      case "صغير":
        _textScaleFactor = 0.85;
        break;
      case "متوسط":
        _textScaleFactor = 1.0;
        break;

      case "كبير":
        _textScaleFactor = 1.2;
        break;

      case "كبير جدا":
        _textScaleFactor = 1.45;
        break;

      case "تلقائي":
        _isSystemFont = true;
        _textScaleFactor = 1.0;
        break;
    }

    notifyListeners();
  }
}
