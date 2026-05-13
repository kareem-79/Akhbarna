
import 'package:akhbarna/core/resources/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkPrefsService {


  static Future<void> saveBookmarks(List<String> bookmarks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ChachConstant.keyBookMarket, bookmarks);
  }

  static Future<List<String>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(ChachConstant.keyBookMarket) ?? [];
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ChachConstant.keyBookMarket);
  }
}