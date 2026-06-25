import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/change_password_request.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequest request,
  });
}
