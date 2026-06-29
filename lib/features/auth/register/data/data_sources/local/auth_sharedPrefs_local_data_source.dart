import 'package:akhbarna/core/resources/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/errors/app_exception.dart';
import 'auth_local_data_source.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedprefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ChachConstant.tokenKey, token);
    } catch (exception) {
      throw LocalException(message: "Failed to save token");
    }
  }

  @override
  Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(ChachConstant.tokenKey) ?? '';
    } catch (exception) {
      throw LocalException(message: "Failed to get token");
    }
  }

  @override
  Future<String> getUserId() async {
    final token = await getToken();

    if (token.isEmpty) return "";

    final decoded = JwtDecoder.decode(token);

    return decoded["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"] ??
        "";
  }
}
