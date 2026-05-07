import 'package:flutter/material.dart';
import '../core/prefs_manager/prefs_manager.dart';
import '../core/utils/font_size.dart';
import '../model/language_model.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  double _textScaleFactor = 1.0;
  bool _isSystemFont = true;

  FontSize _fontSize = FontSize.medium;

  Locale _currentLocale = const Locale('ar', 'EG');

  double get textScaleFactor => _textScaleFactor;

  bool get isSystemFont => _isSystemFont;

  FontSize get fontSize => _fontSize;

  Locale get currentLocale => _currentLocale;

  Future<void> loadSavedSettings() async {
    currentTheme = PrefsManager.getSavedTheme() ?? ThemeMode.light;
    _currentLocale =
        PrefsManager.getSavedLanguage() ?? const Locale('ar', 'EG');

    _isSystemFont = PrefsManager.getIsSystemFont();

    final savedFont = PrefsManager.getSavedFontSize();

    if (_isSystemFont || savedFont == null) {
      _fontSize = FontSize.auto;
      _textScaleFactor = 1.0;
    } else {
      _fontSize = FontSize.values.firstWhere(
        (e) => e.name == savedFont,
        orElse: () => FontSize.medium,
      );

      _applyFontScale(_fontSize);
    }

    notifyListeners();
  }

  String get currentLanguageName {
    return AppLanguage.languages
        .firstWhere(
          (lang) => lang.locale == _currentLocale,
          orElse: () => AppLanguage.languages.first,
        )
        .name;
  }

  String get currentLanguageCode => _currentLocale.languageCode;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);
    notifyListeners();
  }

  void setSystemFont(bool isSystem) {
    _isSystemFont = isSystem;

    PrefsManager.saveIsSystemFont(isSystem);

    if (isSystem) {
      _fontSize = FontSize.auto;
      _textScaleFactor = 1.0;
    }

    notifyListeners();
  }

  void _applyFontScale(FontSize size) {
    switch (size) {
      case FontSize.small:
        _textScaleFactor = 0.85;
        break;
      case FontSize.medium:
        _textScaleFactor = 1.0;
        break;
      case FontSize.large:
        _textScaleFactor = 1.2;
        break;
      case FontSize.extraLarge:
        _textScaleFactor = 1.45;
        break;
      case FontSize.auto:
        _textScaleFactor = 1.0;
        break;
    }
  }

  void changeFontSize(FontSize size) {
    _isSystemFont = false;
    _fontSize = size;

    _applyFontScale(size);

    PrefsManager.saveFontSize(size.name);
    PrefsManager.saveIsSystemFont(false);

    notifyListeners();
  }

  void changeLanguage(Locale newLocale) {
    if (_currentLocale == newLocale) return;
    _currentLocale = newLocale;
    PrefsManager.saveLanguage(newLocale);
    notifyListeners();
  }

  void changeLanguageByCode(String langCode) {
    final language = AppLanguage.languages.firstWhere(
      (lang) => lang.code == langCode.toLowerCase(),
      orElse: () => AppLanguage.languages.first,
    );
    changeLanguage(language.locale);
  }

  FontSize get effectiveFontSize {
    if (_isSystemFont) return FontSize.auto;
    return _fontSize;
  }
}
