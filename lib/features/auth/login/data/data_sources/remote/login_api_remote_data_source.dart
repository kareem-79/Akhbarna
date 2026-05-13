import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginResponse.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';

class LoginApiRemoteDataSource implements LoginRemoteDataSource{
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response =
          await dio.post(ApiConstant.loginEndpoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message=exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to login");
    }
  }
}