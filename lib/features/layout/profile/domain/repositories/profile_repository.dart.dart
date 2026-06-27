import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/update_profile_request.dart';
import '../../data/models/update_profile_response_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UpdateProfileResponse>> updateProfile({
    required UpdateProfileRequest request,
  });
  Future<Either<Failure, UpdateProfileResponse>> getProfile();
}
