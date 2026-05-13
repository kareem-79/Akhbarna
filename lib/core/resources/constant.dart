class ChachConstant {
  static const String themeKey = "theme";
  static const String languageKey = "language";
  static const String isFirst = "isFirst";
  static const String isLoggedIn = "isLoggedIn";
  static const String light = "Light";
  static const String dark = "Dark";
  static const String fontSizeKey = "font_size";
  static const String isSystemFontKey = "is_system_font";
  static const String selectedCountryIndex = 'selected_country_index';
  static const String selectedCountryName = 'selected_country_name';
  static const String selectedSources = 'selected_sources';
  static const String selectedCategories = 'selected_categories';
  static const String keyBookMarket = 'bookmarks';

}
abstract class ApiConstant{
  static const String baseUrl='http://akhbarna1.runasp.net/api/v1/';
  static const String registerEndpoint='auth/register';
  static const String loginEndpoint='auth/login';
}