import 'package:akhbarna/core/resources/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPrefsService {
  static Future<void> saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(ChachConstant.selectedCountryIndex, index);
  }

  static Future<int> getSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(ChachConstant.selectedCountryIndex) ?? -1;
  }

  static Future<void> saveSelectedCountry(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(ChachConstant.selectedCountryName, name);
  }

  static Future<String?> getSelectedCountry() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ChachConstant.selectedCountryName);
  }

  static Future<void> clearSelection() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ChachConstant.selectedCountryIndex);
    await prefs.remove(ChachConstant.selectedCountryName);
  }
}
