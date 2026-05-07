import 'package:flutter/material.dart';

class AppLanguage {
  final String code;
  final String name;
  final String flag;
  final Locale locale;

  const AppLanguage({
    required this.code,
    required this.name,
    required this.flag,
    required this.locale,
  });

  static const List<AppLanguage> languages = [
    AppLanguage(
      code: 'ar',
      name: 'العربية (مصر)',
      flag: '🇪🇬',
      locale: Locale('ar', 'EG'),
    ),
    AppLanguage(
      code: 'de',
      name: 'German',
      flag: '🇩🇪',
      locale: Locale('de', 'DE'),
    ),
    AppLanguage(
      code: 'en',
      name: 'English',
      flag: '🇬🇧',
      locale: Locale('en', 'US'),
    ),
    AppLanguage(
      code: 'es',
      name: 'Spanish',
      flag: '🇪🇸',
      locale: Locale('es', 'ES'),
    ),
    AppLanguage(
      code: 'fr',
      name: 'French',
      flag: '🇫🇷',
      locale: Locale('fr', 'FR'),
    ),
    AppLanguage(
      code: 'hi',
      name: 'Hindi',
      flag: '🇮🇳',
      locale: Locale('hi', 'IN'),
    ),
    AppLanguage(
      code: 'it',
      name: 'Italian',
      flag: '🇮🇹',
      locale: Locale('it', 'IT'),
    ),
    AppLanguage(
      code: 'ja',
      name: 'Japanese',
      flag: '🇯🇵',
      locale: Locale('ja', 'JP'),
    ),
    AppLanguage(
      code: 'ko',
      name: 'Korean',
      flag: '🇰🇷',
      locale: Locale('ko', 'KR'),
    ),
    AppLanguage(
      code: 'nl',
      name: 'Dutch',
      flag: '🇳🇱',
      locale: Locale('nl', 'NL'),
    ),
    AppLanguage(
      code: 'pt',
      name: 'Portuguese',
      flag: '🇵🇹',
      locale: Locale('pt', 'PT'),
    ),
    AppLanguage(
      code: 'ru',
      name: 'Russian',
      flag: '🇷🇺',
      locale: Locale('ru', 'RU'),
    ),
    AppLanguage(
      code: 'sv',
      name: 'Swedish',
      flag: '🇸🇪',
      locale: Locale('sv', 'SE'),
    ),
    AppLanguage(
      code: 'tr',
      name: 'Turkish',
      flag: '🇹🇷',
      locale: Locale('tr', 'TR'),
    ),
    AppLanguage(
      code: 'zh',
      name: 'Chinese',
      flag: '🇨🇳',
      locale: Locale('zh', 'CN'),
    ),
  ];
}