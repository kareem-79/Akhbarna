import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/RegisterRequest.dart';
import '../entities/user_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequest request);
}