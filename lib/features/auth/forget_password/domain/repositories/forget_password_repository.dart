import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/OtpRequest.dart';
import '../../data/models/OtpResponse.dart';
import '../../data/models/ResetPasswordRequest.dart';
import '../../data/models/ResetPasswordResponse.dart';
import '../../data/models/VerifyOtpRequest.dart';
import '../../data/models/VerifyOtpResponse.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, OtpResponse>> sendOtp(SendOtpRequest request);

  Future<Either<Failure, VerifyOtpResponse>> verifyOtp(
    VerifyOtpRequest request,
  );

  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  );
}
