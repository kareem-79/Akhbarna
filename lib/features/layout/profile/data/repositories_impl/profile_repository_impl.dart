import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/profile_repository.dart.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/update_profile_request.dart';
import '../models/update_profile_response_model.dart';

@Singleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UpdateProfileResponse>> updateProfile({
    required UpdateProfileRequest request,
  }) async {
    try {
      final response = await remoteDataSource.updateProfile(request: request);

      return Right(response);
    } on AppException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileResponse>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Right(response);
    } on AppException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
