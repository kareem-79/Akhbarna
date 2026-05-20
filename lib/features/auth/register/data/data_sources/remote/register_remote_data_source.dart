import 'package:akhbarna/features/auth/register/data/models/RegisterRequest.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterResponse.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);
}