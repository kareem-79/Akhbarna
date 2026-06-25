import '../../models/OtpRequest.dart';
import '../../models/OtpResponse.dart';
import '../../models/ResetPasswordRequest.dart';
import '../../models/ResetPasswordResponse.dart';
import '../../models/VerifyOtpRequest.dart';
import '../../models/VerifyOtpResponse.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<OtpResponse> sendOtp(SendOtpRequest request);

  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}
