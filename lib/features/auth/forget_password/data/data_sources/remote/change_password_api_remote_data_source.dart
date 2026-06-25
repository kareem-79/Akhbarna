import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';
import '../../../../register/data/data_sources/local/auth_local_data_source.dart';
import '../../models/change_password_request.dart';
import 'change_password_remote_data_source.dart';

@Singleton(as: ChangePasswordRemoteDataSource)
class ChangePasswordApiRemoteDataSource
    implements ChangePasswordRemoteDataSource {
  final AuthLocalDataSource authLocalDataSource;

  ChangePasswordApiRemoteDataSource({required this.authLocalDataSource});

  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<void> changePassword({required ChangePasswordRequest request}) async {
    try {
      final token = await authLocalDataSource.getToken();

      await dio.post(
        ApiConstant.changePasswordEndpoint,
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        if (exception.response?.data is Map<String, dynamic>) {
          message = exception.response?.data["message"];
        } else if (exception.response?.data is String) {
          message = exception.response?.data;
        }
      }

      throw RemoteException(message: message ?? "Failed to change password");
    }
  }
}
