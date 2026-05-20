import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../register/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> login(LoginRequest request);
}
