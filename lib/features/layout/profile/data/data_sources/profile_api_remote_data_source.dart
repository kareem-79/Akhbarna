import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/constant.dart';
import '../../../../auth/register/data/data_sources/local/auth_local_data_source.dart';
import '../models/update_profile_request.dart';
import '../models/update_profile_response_model.dart';
import 'profile_remote_data_source.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource implements ProfileRemoteDataSource {
  final AuthLocalDataSource authLocalDataSource;

  ProfileApiRemoteDataSource({required this.authLocalDataSource});

  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<UpdateProfileResponse> updateProfile({
    required UpdateProfileRequest request,
  }) async {
    try {
      final token = await authLocalDataSource.getToken();

      final formData = FormData.fromMap({
        "Name": request.name,
        "Email": request.email,
        if (request.image != null)
          "Image": await MultipartFile.fromFile(
            request.image!.path,
            filename: request.image!.path.split('/').last,
          ),
      });

      final response = await dio.put(
        ApiConstant.updateProfileEndpoint,
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return UpdateProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = "Failed to update profile";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }

  @override
  Future<UpdateProfileResponse> getProfile() async {
    try {
      final token = await authLocalDataSource.getToken();

      final response = await dio.get(
        ApiConstant.updateProfileEndpoint,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return UpdateProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = "Failed to load profile";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }
}
