import '../../models/OtpRequest.dart';
import '../../models/OtpResponse.dart';

abstract class ForgetPasswordRemoteDataSource {

  Future<OtpResponse> sendOtp(
      SendOtpRequest request,
      );

}