import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginResponse.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest request);
}
