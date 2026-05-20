import 'package:akhbarna/features/auth/register/data/data_sources/remote/register_remote_data_source.dart';
import 'package:akhbarna/features/auth/register/data/models/RegisterRequest.dart';
import 'package:akhbarna/features/auth/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../data_sources/local/auth_local_data_source.dart';
@Singleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  RegisterRepositoryImpl({
    required this.registerApiRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async {
    try {
      final response = await registerApiRemoteDataSource.register(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.toUserEntity());
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
