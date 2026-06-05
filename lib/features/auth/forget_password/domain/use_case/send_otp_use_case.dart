import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/OtpRequest.dart';
import '../../data/models/OtpResponse.dart';
import '../repositories/forget_password_repository.dart';
@injectable
class SendOtpUseCase {
  ForgetPasswordRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, OtpResponse>> call(SendOtpRequest request) {
    return repository.sendOtp(request);
  }
}
