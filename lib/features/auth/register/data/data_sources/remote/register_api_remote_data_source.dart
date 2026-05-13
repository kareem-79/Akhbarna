import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_remote_data_source.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterRequest.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterResponse.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';

class RegisterApiRemoteDataSource implements RegisterRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        ApiConstant.registerEndpoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to register");
    }
  }
}
