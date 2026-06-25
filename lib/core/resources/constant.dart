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
  static const String tokenKey = 'token';
  static const String userName = 'user_name';
  static const String profileImage = 'profile_image';
}

abstract class ApiConstant {
  static const String baseUrl = 'http://akhbarna1.runasp.net/api/v1/';
  static const String registerEndpoint = 'auth/register';
  static const String loginEndpoint = 'auth/login';
  static const String forgetPassword = 'auth/forgot-password';
  static const String changePasswordEndpoint = 'auth/change-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';

}

abstract class NewsApiConstant {
  static const String baseUrl =
      "http://akhbarna1.runasp.net/api/Article/static/";
  static const String breakingNews = "breaking";
  static const String mostReadNews = "most-read";
  static const String topNews = "latest";
  static const String byCategory = "by-category";
  static const String trendingNews = "trending";
  static const String weatherBaseUrl = "https://api.weatherapi.com/v1/";
  static const String weatherApiKey = "f3f6d3d527aa42a08d2224953261906";
  static const String currentWeather = "current.json";
  static const String matchBaseUrl = "http://akhbarna1.runasp.net/api/";
  static const String match = "matches/important";
  static const String searchArticles = "search";
  static const String baseUrlSavedArticle = "http://akhbarna1.runasp.net/api/";
  static const String savedArticle = "saved";

}
abstract class PlatformConstant {
  static const String facebook = "https://www.facebook.com/sharer/sharer.php?u=";
  static const String twitter = "https://twitter.com/intent/tweet?url=";
  static const String whatsApp = "https://wa.me/?text=";
}
