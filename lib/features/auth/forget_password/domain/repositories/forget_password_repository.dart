import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/OtpRequest.dart';
import '../../data/models/OtpResponse.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, OtpResponse>> sendOtp(SendOtpRequest request);
}
