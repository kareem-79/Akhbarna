import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/constant.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode themeMode) {
    String theme = themeMode == ThemeMode.dark
        ? ChachConstant.dark
        : ChachConstant.light;
    prefs.setString(ChachConstant.themeKey, theme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(ChachConstant.themeKey);
    if (savedTheme != null) {
      if (savedTheme == ChachConstant.dark) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    }
    return null;
  }

  static void saveLanguage(Locale language) {
    prefs.setString(ChachConstant.languageKey, language.languageCode);
  }

  static Locale? getSavedLanguage() {
    String? savedCode = prefs.getString(ChachConstant.languageKey);
    if (savedCode != null) {
      return Locale(savedCode);
    }
    return null;
  }

  static Future<void> saveEntering() async {
    prefs.setBool(ChachConstant.isFirst, true);
  }

  static Future<bool> checkEntering() async {
    return prefs.getBool(ChachConstant.isFirst) ?? false;
  }

  static void saveFontSize(String fontSize) {
    prefs.setString(ChachConstant.fontSizeKey, fontSize);
  }

  static String? getSavedFontSize() {
    return prefs.getString(ChachConstant.fontSizeKey);
  }

  static void saveIsSystemFont(bool isSystem) {
    prefs.setBool(ChachConstant.isSystemFontKey, isSystem);
  }

  static bool getIsSystemFont() {
    return prefs.getBool(ChachConstant.isSystemFontKey) ?? true;
  }
}
