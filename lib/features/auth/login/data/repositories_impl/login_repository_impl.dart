import 'package:akhbarna/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:akhbarna/features/auth/login/data/models/LoginRequest.dart';
import 'package:akhbarna/features/auth/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../../register/data/data_sources/local/auth_local_data_source.dart';
import '../../../register/domain/entities/user_entity.dart';
@Singleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  LoginRepositoryImpl({required this.loginApiRemoteDataSource,required this.authLocalDataSource});

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest request) async {
    try {
      final response = await loginApiRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.toUserEntity());
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
