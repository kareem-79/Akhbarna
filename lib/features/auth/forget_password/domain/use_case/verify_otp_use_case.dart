import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/VerifyOtpRequest.dart';
import '../../data/models/VerifyOtpResponse.dart';
import '../repositories/forget_password_repository.dart';

@injectable
class VerifyOtpUseCase {
  final ForgetPasswordRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, VerifyOtpResponse>> call(VerifyOtpRequest request) {
    return repository.verifyOtp(request);
  }
}
