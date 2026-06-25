import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/ResetPasswordRequest.dart';
import '../../data/models/ResetPasswordResponse.dart';
import '../repositories/forget_password_repository.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, ResetPasswordResponse>> call(
    ResetPasswordRequest request,
  ) {
    return repository.resetPassword(request);
  }
}
