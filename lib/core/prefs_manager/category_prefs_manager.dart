import 'package:akhbarna/core/resources/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPrefsService {


  static Future<void> saveSelectedCategories(List<String> categories) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ChachConstant.selectedCategories, categories);
  }

  static Future<List<String>> getSelectedCategories() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(ChachConstant.selectedCategories) ?? [];
  }

  static Future<void> clearCategories() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ChachConstant.selectedCategories);
  }
}
