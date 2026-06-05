import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/resources/constant.dart';
import '../../models/OtpRequest.dart';
import '../../models/OtpResponse.dart';
import 'forget_password_remote_data_source.dart';

@Singleton(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordApiRemoteDataSource
    implements ForgetPasswordRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<OtpResponse> sendOtp(SendOtpRequest request) async {
    final response = await dio.post(
      ApiConstant.forgetPassword,

      data: request.toJson(),
    );
    return OtpResponse.fromJson(response.data);
  }
}
