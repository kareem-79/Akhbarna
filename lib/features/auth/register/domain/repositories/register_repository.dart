import 'package:akhbarna/features/auth/register/data/models/RegisterResponse.dart';

import '../../data/models/RegisterRequest.dart';

abstract class RegisterRepository {
  Future<RegisterResponse> register(RegisterRequest request);
}
