import 'package:akhbarna/core/resources/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SourcePrefsService {


  static Future<void> saveSelectedSources(List<String> sources) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ChachConstant.selectedSources, sources);
  }

  static Future<List<String>> getSelectedSources() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(ChachConstant.selectedSources) ?? [];
  }
  
  static Future<void> clearSources() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ChachConstant.selectedSources);
  }
}