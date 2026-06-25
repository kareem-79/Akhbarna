import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';
import '../../models/OtpRequest.dart';
import '../../models/OtpResponse.dart';
import '../../models/ResetPasswordRequest.dart';
import '../../models/ResetPasswordResponse.dart';
import '../../models/VerifyOtpRequest.dart';
import '../../models/VerifyOtpResponse.dart';
import 'forget_password_remote_data_source.dart';

@Singleton(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordApiRemoteDataSource
    implements ForgetPasswordRemoteDataSource {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ),
  );

  @override
  Future<OtpResponse> sendOtp(SendOtpRequest request) async {
    try {
      final response = await dio.post(
        ApiConstant.forgetPassword,
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return OtpResponse.fromJson(response.data);
      }

      throw AppException(
        message: response.data["message"] ?? "Something went wrong",
      );
    } on DioException catch (e) {
      throw AppException(
        message:
            e.response?.data["message"] ?? e.message ?? "Something went wrong",
      );
    } catch (_) {
      throw AppException(message: "Something went wrong");
    }
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest request) async {
    try {
      final response = await dio.post(
        ApiConstant.verifyOtp,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return VerifyOtpResponse.fromJson(response.data);
      }

      throw AppException(message: response.data["message"] ?? "Invalid OTP");
    } on DioException catch (e) {
      throw AppException(
        message:
            e.response?.data["message"] ?? e.message ?? "Something went wrong",
      );
    } catch (_) {
      throw AppException(message: "Something went wrong");
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstant.resetPassword,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ResetPasswordResponse.fromJson(response.data);
      }

      throw AppException(
        message: response.data["message"] ?? "Something went wrong",
      );
    } on DioException catch (e) {
      throw AppException(
        message:
            e.response?.data["message"] ?? e.message ?? "Something went wrong",
      );
    }
  }
}
