import '../models/update_profile_request.dart';
import '../models/update_profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateProfileResponse> updateProfile({
    required UpdateProfileRequest request,
  });

  Future<UpdateProfileResponse> getProfile();
}
